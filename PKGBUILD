# Set this flag to 1 if you want to hide Bismuth tray icon.
HIDE_TRAY_ICON=0

pkgname=kwin-bismuth-bin
pkgver=2.3.0
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
    'fe49461aaa91403787c4c9b0bdc58adec7432db1cdfdaf304e64caf3ea2f0f3bf23f6fae06da4ed1fa5530030bafeba95112ada96c28a9922882b69fcab886fa'
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
