# Maintainer: BillyAddlers <finnsonalca123@gmail.com>
#
# ishellpro — native Arch package built from the official upstream AppImage.
#
# Why this package exists
# -----------------------
# Upstream only publishes a linuxdeploy-built AppImage. Its AppRun hook forces
# the AppImage's own bundled libraries onto LD_LIBRARY_PATH:
#
#   LD_LIBRARY_PATH="$APPDIR/usr/lib/x86_64-linux-gnu:$APPDIR/usr/lib:..."
#
# Those are Ubuntu 22.04 builds (ICU 70, WebKitGTK 2.4x linked against libsoup3,
# GTK 3.24, GStreamer, ...). They permanently shadow the host libraries, so the
# app never gets Arch's updates, breaks whenever the bundled set drifts from the
# kernel/loader, and drags ~238 MiB of duplicated libraries around. That is the
# "AppImage dependency trap".
#
# This PKGBUILD extracts the AppImage, keeps ONLY the application payload (the
# ishellpro ELF, its icons and the .desktop entry) and drops every bundled
# library. The installed binary then links against Arch's own gtk3 /
# webkit2gtk-4.1 / libsoup3 / glib2 / ICU just like any other native package.
#
# Verified locally:
#   * upstream binary RUNPATH is "$ORIGIN/../lib"; at /usr/bin/ishellpro that
#     resolves to /usr/lib, and `ldd` reports no missing objects,
#   * the app starts and initialises (window, sqlite DB, tray) against the system
#     WebKitGTK 2.54 / GTK 3.24 / ICU 78 stack under a clean environment.
#
# Upstream only ships x86_64 for Linux (the aarch64 update feed re-serves the
# x86_64 build), hence arch=('x86_64').

pkgname=ishellpro
pkgver=3.1.58
pkgrel=1
pkgdesc="Lightweight cross-platform SSH/SFTP terminal client (native repack of the upstream AppImage)"
arch=('x86_64')
url="https://ishell.cc"
license=('custom:proprietary')
install="${pkgname}.install"

# The GUI stack is pulled in transitively:
#   gtk3            -> glib2, gdk-pixbuf2, pango, cairo, at-spi2-core, dconf, ...
#   webkit2gtk-4.1  -> libsoup3, bubblewrap, libsecret, gstreamer, icu, libwpe, ...
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'libayatana-appindicator'  # system tray icon
  'xdg-utils'                # xdg-open / xdg-mime (opener plugin, scheme handlers)
  'hicolor-icon-theme'
)
optdepends=(
  'xdg-desktop-portal: file open/save dialogs and OpenURI under Wayland'
  'xdg-desktop-portal-gtk: GTK portal backend'
)

# Prebuilt binary: a separate -debug package is pointless.
options=('!debug')

source=("${pkgname}-${pkgver}-amd64.AppImage::https://ishell-down.oss-cn-beijing.aliyuncs.com/ishellpro_${pkgver}_amd64.AppImage")
sha256sums=('7b8d9503706323497a5ec3924f6ea9c5a254f147bcb763dd4bb3951f9b967835')

package() {
  # Extract in-tree. --appimage-extract uses the runtime's built-in squashfs
  # reader, so no FUSE and no squashfs-tools are required.
  chmod +x "${pkgname}-${pkgver}-amd64.AppImage"
  ./"${pkgname}-${pkgver}-amd64.AppImage" --appimage-extract >/dev/null

  local appdir='squashfs-root'

  # Application binary. Installed under /usr/bin so the binary's own
  # "$ORIGIN/../lib" RUNPATH resolves to the system /usr/lib.
  install -Dm755 "${appdir}/usr/bin/ishellpro" "${pkgdir}/usr/bin/ishellpro"

  # Icons (all sizes upstream ships).
  install -Dm644 "${appdir}/usr/share/icons/hicolor/32x32/apps/ishellpro.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/ishellpro.png"
  install -Dm644 "${appdir}/usr/share/icons/hicolor/128x128/apps/ishellpro.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ishellpro.png"
  install -Dm644 "${appdir}/usr/share/icons/hicolor/256x256@2/apps/ishellpro.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/ishellpro.png"

  # Desktop entry. Upstream ships an empty Categories=; fix it and give it a
  # proper comment. MimeType (scheme handlers) is kept as-is.
  install -Dm644 "${appdir}/usr/share/applications/ishellpro.desktop" \
    "${pkgdir}/usr/share/applications/ishellpro.desktop"
  sed -i \
    -e 's/^Categories=$/Categories=Network;/' \
    -e 's|^Comment=.*|Comment=Lightweight cross-platform SSH/SFTP terminal client|' \
    "${pkgdir}/usr/share/applications/ishellpro.desktop"

  # Everything else in the AppImage is intentionally NOT installed:
  #   usr/lib/** , usr/lib/x86_64-linux-gnu/**   bundled Ubuntu libraries + WebKit
  #                                              helper processes + GTK/GIO/pixbuf
  #                                              loaders -> provided by depends=()
  #   usr/bin/xdg-open, usr/bin/xdg-mime         -> provided by xdg-utils
  #   usr/share/glib-2.0/schemas/**              -> provided by gsettings-desktop-schemas
  #   usr/share/doc/**                           -> Ubuntu copyright stubs
}
