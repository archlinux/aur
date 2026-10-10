# Maintainer: cmach_socket <solaris@cmach.top>

pkgname=oceanus-bin
_pkgname=${pkgname%-bin}
pkgver="1.4.1"
pkgrel=1
pkgdesc="一个 Flutter 网易云音乐客户端"
arch=('x86_64')
url='https://github.com/cmachsocket/oceanus'
license=('GPL-3.0-or-later')

# ---------------------------------------------------------------------------
# Layout note (upstream-fixed /opt/oceanus/):
#   The upstream .deb ships ELF files under opt/oceanus/ and a
#   /usr/bin/oceanus -> /opt/oceanus/oceanus symlink, which the .desktop
#   Exec= line relies on. Relocating the tree to /usr/lib/oceanus would
#   diverge from upstream packaging and force re-patching every DT_NEEDED
#   string in the Flutter binaries; we therefore preserve the Debian layout.
#   namcap flags this as 'ELF files outside of a valid path'; this is
#   intentional and required for the bundled libs to resolve each other.
# ---------------------------------------------------------------------------

depends=(
    # Explicitly required by the app / its bundled plugins:
    'gtk3'             # bundled libflutter_linux_gtk.so + GTK UI
    'mpv'              # libapp.so dlopen()s libmpv.so.{1,2} via media_kit
    'nodejs'           # DesktopNcmBridge spawns 'node' to run
                       # flutter_assets/.../bundle.js (ncm_api_enhanced)
    'gcc-libs'         # libstdc++.so.6, libgcc_s.so.1 pulled in transitively

    # Explicitly listing what namcap would otherwise flag as "implicitly
    # satisfied" (the linked libs are hard NEEDED in the Flutter binaries):
    'glib2'            # libglib-2.0.so.0, libgobject-2.0.so.0, libgio-2.0.so.0
    'gdk-pixbuf2'      # libgdk_pixbuf-2.0.so.0
    'zlib'             # libz.so.1
    'harfbuzz'         # libharfbuzz.so.0
    'fontconfig'       # libfontconfig.so.1 (libflutter_linux_gtk.so)
    'pango'            # libpango-1.0.so.0, libpangocairo-1.0.so.0
    'at-spi2-core'     # libatk-1.0.so.0
    'cairo'            # libcairo.so.2, libcairo-gobject.so.2
    'libepoxy'         # libepoxy.so.0 (libflutter_linux_gtk.so)
    'hicolor-icon-theme'  # we ship usr/share/icons/hicolor/512x512/apps/oceanus.png
    'dbus'             # libdbus-1.so.3 (StatusNotifierItem + MPRIS)
)
optdepends=(
    'gnome-shell-extension-appindicator: show the tray icon on GNOME'
)
makedepends=('patchelf')
options=('strip' 'debug')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "${_pkgname}_${pkgver}+1_amd64.deb::https://github.com/cmachsocket/oceanus/releases/download/v${pkgver}/oceanus_${pkgver}+1_amd64.deb"
    # GPL-3.0-or-later text from the SPDX license list (not bundled in the
    # upstream .deb; we ship it ourselves to satisfy /usr/share/licenses).
    'GPL-3.0-or-later.txt::https://raw.githubusercontent.com/spdx/license-list-data/main/text/GPL-3.0-or-later.txt'
)
sha512sums=('a957bc148dbc5ff834c860190e3fe77fc773260fa3ebbcf4a2f454ad80005ca112295dd8c084ed1a107e327ddd94655bd363deef3b3297100d63dfa0a449b584'
            '165f8007d3397e1fd4c30a42039122c3ed8f9f5d45274d682f4707fadb093ab7a8f9336724db6eb7653acb9cee42d39fd98fb72811afce635af03a9f2ef66181')

# ---------------------------------------------------------------------------
# Known upstream issues that namcap reports but cannot be fixed without
# rebuilding from source (kept here for review transparency):
#
#   * "ELF file lacks FULL RELRO" on libapp.so, libdartjni.so,
#     libmedia_kit_libs_linux_plugin.so, and the oceanus binary itself.
#     Upstream Flutter Linux release artefacts do not enable -z now/-z relro.
#
#   * Many "Unused shared library" warnings (libdl, libpthread, libgtk-3,
#     libgdk-3, libstdc++, libm, ...). These are false positives: Flutter's
#     engine and the media_kit plugin dlopen()/load lazily, which namcap's
#     static DT_NEEDED walker does not see.
#
#   * checkpkg: 'target not found: oceanus-bin'. Expected on first AUR
#     submission; there is no previous version to diff against.
# ---------------------------------------------------------------------------

package() {
    local _debdir="${srcdir}/deb-extract"
    local _datadir="${srcdir}/deb-data"
    local _data_archive

    rm -rf "${_debdir}" "${_datadir}"
    mkdir -p "${_debdir}" "${_datadir}"

    cd "${_debdir}"
    ar x "${srcdir}/${_pkgname}_${pkgver}+1_amd64.deb"

    _data_archive=$(printf '%s\n' data.tar.*)
    bsdtar -xf "${_data_archive}" -C "${_datadir}"

    cp -a "${_datadir}/." "${pkgdir}/"

    # Strip the insecure RUNPATH that leaked from the upstream CI runner
    # build directory (/home/runner/work/...). The plugins do not need any
    # rpath because their NEEDED entries (libflutter_linux_gtk.so etc.) are
    # colocated in the same directory and resolved via the main executable's
    # $ORIGIN/lib RUNPATH at dlopen() time.
    #
    # Note: apply this to every bundled ELF, not just the media_kit plugin --
    # libwindow_manager_plugin.so and libscreen_retriever_linux_plugin.so
    # carry the same leaked CI path.
    local _elf
    while IFS= read -r -d '' _elf; do
        case "$(patchelf --print-rpath "${_elf}" 2>/dev/null)" in
            /home/runner/*) patchelf --remove-rpath "${_elf}" ;;
        esac
    done < <(find "${pkgdir}/opt/oceanus" -type f \
        \( -name 'oceanus' -o -name '*.so' \) -print0)

    # Ship the actual GPL-3.0-or-later text. The upstream .deb only carries
    # a symlink to /usr/share/licenses/common/GPL-3, which is a Debian-ism
    # and does not exist on Arch.
    install -Dm644 \
        "${srcdir}/GPL-3.0-or-later.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
