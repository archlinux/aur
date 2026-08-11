# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=hoppscotch-bin-wayland
pkgver=26.7.0
# Upstream tags releases as v<version>-<build>; bump _build when upstream
# re-releases the same version and reset it on a version bump.
_build=0
pkgrel=1
pkgdesc="Hoppscotch - open source API development ecosystem (prebuilt, launched natively on Wayland)"
arch=('x86_64')
url="https://hoppscotch.io/"
license=('MIT')
depends=(
    'cairo'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'webkit2gtk-4.1'
    'zlib'
)
provides=('hoppscotch' 'hoppscotch-desktop')
conflicts=('hoppscotch' 'hoppscotch-bin' 'hoppscotch-desktop')
options=('!strip' '!debug')

# Upstream ships both a .deb and an .AppImage for linux/x64. The .deb is used
# here: it links against the system webkit2gtk-4.1/gtk3 instead of bundling a
# private (and quickly outdated) copy of them, which is also what makes the
# native Wayland path below behave like the rest of the desktop.
_licrev='1350919c7869047845a60ff36fb41a7d70fe8407'
source=(
    "${pkgname}-${pkgver}-${_build}.deb::https://github.com/hoppscotch/releases/releases/download/v${pkgver}-${_build}/Hoppscotch_linux_x64.deb"
    "LICENSE-${_licrev::7}::https://raw.githubusercontent.com/hoppscotch/hoppscotch/${_licrev}/LICENSE"
    'hoppscotch-desktop-wayland.sh'
    'hoppscotch-desktop.desktop'
)
sha256sums=(
    'ee19c968d0183720a4cee39314423d08700dedf26e1796c42c7f02cffbb72425'
    'a5e6ddb3af783a02eacc848cbe309cc0940b4859ac653e9b1a2e21a4fea22552'
    'SKIP'
    'SKIP'
)

prepare() {
    mkdir -p "${srcdir}/data"
    cd "${srcdir}/data"
    ar x "${srcdir}/${pkgname}-${pkgver}-${_build}.deb"
    tar xzf data.tar.gz
}

package() {
    cd "${srcdir}/data"

    # The Wayland app_id this app reports is just the basename of the running
    # executable (GTK's g_get_prgname()), verified by renaming the binary and
    # reading resourceClass back from the compositor. So the real binary has to
    # keep the name "hoppscotch-desktop" wherever it is parked - renaming it to
    # e.g. hoppscotch-desktop-bin and wrapping that would hand the window an
    # app_id no .desktop file matches, which costs the icon and taskbar
    # grouping on Wayland. The wrapper execs an absolute path, so argv[0] and
    # therefore the app_id stay correct no matter how the wrapper is invoked.
    install -Dm755 usr/bin/hoppscotch-desktop \
        "${pkgdir}/usr/lib/hoppscotch/hoppscotch-desktop"
    install -Dm755 "${srcdir}/hoppscotch-desktop-wayland.sh" \
        "${pkgdir}/usr/bin/hoppscotch-desktop"
    ln -s hoppscotch-desktop "${pkgdir}/usr/bin/hoppscotch"

    # Named after the app_id for the same reason: Plasma/GNOME resolve a
    # Wayland window to <app_id>.desktop, and upstream's Hoppscotch.desktop
    # does not match. It also has an empty Categories= and no %u despite
    # registering a scheme handler, so ship our own instead of the bundled one.
    install -Dm644 "${srcdir}/hoppscotch-desktop.desktop" \
        "${pkgdir}/usr/share/applications/hoppscotch-desktop.desktop"

    # Upstream ships 32, 128 and a 256px file misfiled under 256x256@2 (that
    # directory means 256 logical at scale 2, i.e. 512px). Install it by its
    # real pixel size, and also as 128@2 - which is exactly what a 256px icon
    # is - so HiDPI lookups find it.
    install -Dm644 usr/share/icons/hicolor/32x32/apps/hoppscotch-desktop.png \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/hoppscotch-desktop.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/hoppscotch-desktop.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/hoppscotch-desktop.png"
    install -Dm644 'usr/share/icons/hicolor/256x256@2/apps/hoppscotch-desktop.png' \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hoppscotch-desktop.png"
    install -Dm644 'usr/share/icons/hicolor/256x256@2/apps/hoppscotch-desktop.png' \
        "${pkgdir}/usr/share/icons/hicolor/128x128@2/apps/hoppscotch-desktop.png"

    # No generated in-between sizes on purpose: asked for 48px against this
    # set, the icon theme lookup picks 256x256 and scales it down, so extra
    # pre-rendered sizes would only add an imagemagick makedepend.

    # Fallback for menus that never learned about the icon theme spec.
    # Verified not to shadow the themed icons above at any size.
    install -Dm644 usr/share/icons/hicolor/128x128/apps/hoppscotch-desktop.png \
        "${pkgdir}/usr/share/pixmaps/hoppscotch-desktop.png"

    # Neither the .deb nor the release carries the license text
    install -Dm644 "${srcdir}/LICENSE-${_licrev::7}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
