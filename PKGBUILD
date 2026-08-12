# Maintainer: Yangtse Su <yangtsesu@gmail.com>
#
# masterpdfeditor with bundled, patched copies of the system Qt6 libraries.
#
# Why this variant exists:
#   Arch's qt6 packages are built with the GNU_PROPERTY_1_NEEDED_INDIRECT_EXTERN_ACCESS
#   ELF property. glibc >= 2.36 refuses to load an executable that directly
#   references a protected symbol in a shared object carrying that property
#   ("error due to GNU_PROPERTY_1_NEEDED_INDIRECT_EXTERN_ACCESS"). masterpdfeditor
#   is a closed-source binary that inevitably does such references; the loader
#   check is evaluated against the defining library (map->l_1_needed), so the
#   executable itself cannot be patched to avoid it.
#
#   This package bundles copies of the system Qt6 libraries (the version present
#   on the build host) with the .note.gnu.property note type zeroed (5 -> 0),
#   which makes glibc ignore the note entirely. Library content is otherwise
#   unchanged. Rebuild this package after qt6-base/qt6-svg/qt6-declarative/
#   qt6-5compat upgrades to refresh the bundled libraries. Note that because the
#   libraries are copied from the build host, the package content depends on the
#   Qt6 versions installed at build time.

pkgname=masterpdfeditor-qt6-bundled
pkgver=5.9.99
pkgrel=1
pkgdesc='A complete solution for viewing, creating and editing PDF files'
url='https://code-industry.net/free-pdf-editor/'
arch=('x86_64')
license=('custom:MasterPDFEditor')
depends=('libgl' 'pkcs11-helper' 'qt6-base' 'qt6-svg' 'qt6-declarative' 'qt6-5compat' 'sane')
makedepends=('patchelf' 'qt6-base' 'qt6-svg' 'qt6-declarative' 'qt6-5compat')
optdepends=('qt6-wayland: Wayland platform plugin')
provides=('masterpdfeditor=5.9.99')
conflicts=('masterpdfeditor')
install='masterpdfeditor-qt6-bundled.install'
source_x86_64=("https://code-industry.net/public/master-pdf-editor-${pkgver}-qt6.x86_64.tar.gz")
b2sums_x86_64=('845888727b93b0f2b26200f408d966269d4277f1d9a2b6dafcc2278c956849e1ae11f80bfb1c3a7b6708c753a3f89c39a58a1281a5309a2278119881ce9f634d')

# Qt6 libraries directly required by the application binary (verified with ldd;
# there are no additional transitive Qt6 dependencies).
_qt6libs=(libQt6Concurrent libQt6Core libQt6Core5Compat libQt6DBus libQt6Gui
          libQt6Network libQt6PrintSupport libQt6Qml libQt6Svg libQt6Widgets
          libQt6Xml)

# Zero the NT_GNU_PROPERTY_TYPE_0 note type of a Qt6 library so that glibc stops
# processing its .note.gnu.property (see the header comment for details).
# Note layout: namesz(4) descsz(4) type(4) "GNU"(4) desc...
_strip_qt_property() {
  local lib="$1" off
  off=$(readelf -SW "$lib" | awk '{for(i=1;i<=NF;i++) if ($i == ".note.gnu.property") {print $(i+3); exit}}')
  [ -n "$off" ] || { echo "WARN: $lib has no .note.gnu.property, skipping"; return 0; }
  printf '\000\000\000\000' | dd of="$lib" bs=1 seek=$((16#$off + 8)) conv=notrunc status=none
  if readelf -n "$lib" | grep -q '1_needed: indirect'; then
    echo "ERROR: failed to strip property from $lib" >&2
    return 1
  fi
}

package() {
  install -d "$pkgdir"{/opt/,/usr/bin/}
  cp -a --no-preserve=ownership master-pdf-editor-${pkgver%%.*} "$pkgdir/opt/"

  cd "$pkgdir/opt/master-pdf-editor-${pkgver%%.*}"

  # Bundle the system Qt6 libraries and strip their GNU property so the binary
  # starts without the glibc loader error.
  local real base m
  install -d lib
  for m in "${_qt6libs[@]}"; do
    real=$(readlink -f "/usr/lib/${m}.so.6")
    base=$(basename "$real")
    install -m755 "$real" "lib/$base"
    ln -s "$base" "lib/${m}.so.6"
    _strip_qt_property "lib/$base" || return 1
  done

  # Prefer the bundled libraries, fall back to the system ones.
  patchelf --set-rpath '$ORIGIN/lib:/usr/lib' masterpdfeditor${pkgver%%.*}

  # Launcher wrapper. Qt's compiled-in plugin path is relative (lib/qt6/plugins);
  # with the libraries bundled under <appdir>/lib, the relocated prefix resolves
  # to the app dir and the plugin path becomes <appdir>/lib/qt6/plugins, which
  # does not exist, so the platform plugin is not found. Point QT_PLUGIN_PATH at
  # the system plugins (same Qt version; they bind to the already loaded bundled
  # libraries). LD_LIBRARY_PATH is a fallback.
  cat > "$pkgdir/usr/bin/masterpdfeditor${pkgver%%.*}" <<'WRAPPER'
#!/bin/bash
export QT_PLUGIN_PATH=/usr/lib/qt6/plugins
export LD_LIBRARY_PATH=/opt/master-pdf-editor-5/lib:$LD_LIBRARY_PATH
exec /opt/master-pdf-editor-5/masterpdfeditor5 "$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/masterpdfeditor${pkgver%%.*}"

  # The upstream .desktop file points Exec straight at the binary; route it
  # through the wrapper so QT_PLUGIN_PATH is set.
  local desktop="usr/share/applications/net.code-industry.masterpdfeditor${pkgver%%.*}.desktop"
  sed -i "s|^Exec=.*|Exec=/usr/bin/masterpdfeditor${pkgver%%.*} %f|" "$desktop"

  install -Dm644 "$desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 license_en.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  find usr/share/icons -type f -exec install -Dm644 "{}" "$pkgdir/{}" \;
}
