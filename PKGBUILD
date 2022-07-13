pkgname=kwin-bismuth
pkgver=3.1.2
pkgrel=2
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
_name="${pkgname#kwin-}"
url="https://github.com/Bismuth-Forge/${_name}"
license=('MIT')
depends=('systemsettings')
makedepends=('cmake' 'ninja' 'esbuild' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
options=('!emptydirs')

_snapshot="${_name}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c9eacd2e17dae37ac6df30e774406d6fc44081f1ba6e49e7805265a07b7f7556')

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_NPM=OFF \
        -DUSE_TSC=OFF \
        -DBUILD_TESTING=false

    ninja -C "build"
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}" ninja -C "build" install

    cd "${_snapshot}/LICENSES"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" && cp -rt "$_" *
}
