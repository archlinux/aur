# Set this flag to 1 if you want to hide Bismuth tray icon.
HIDE_TRAY_ICON=0

pkgname=kwin-bismuth-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
url="https://github.com/Bismuth-Forge/bismuth"
license=('MIT')
depends=('systemsettings')
provides=('kwin-bismuth')
conflicts=('kwin-bismuth')
options=('!emptydirs')

_archive="bismuth-bin-${pkgver}.tar.gz"

source=(
    "${_archive}::${url}/releases/download/v${pkgver}/binary-release.tar.gz"
    'hide-tray-icon.patch'
)

sha512sums=(
    'fef20373254918943466f15576b5ee350f00b3e1a64bab970c9f8303eb7fdd01af1303e5b1ebdfe740ec0f407ab4be007d6f83c49880c698ce018e4fa5c4470a'
    'c89e7186cb0f07fc15e88974e2de6a3bb84221278d8582faf0faf6a90bafc19f021b6266a0c96769aa204a501cd4f90cbb987c8e892536636db27a88beeafba9'
)

noextract=("${_archive}")

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/lib/qt" &&
        tar -C "$_" --strip-components=3 -xf "${_archive}" "./lib/x86_64-linux-gnu"

    tar -C "${pkgdir}/usr" --strip-components=1 --exclude="icon-theme.cache" -xf "${_archive}" "./share"

    if [ ${HIDE_TRAY_ICON} = 1 ]; then
        cd "${pkgdir}/usr/share/kwin/scripts/bismuth/contents/ui"
        patch -p0 -N -i "${srcdir}/hide-tray-icon.patch"
    fi
}
