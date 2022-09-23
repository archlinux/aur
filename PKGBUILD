pkgname=kwin-bismuth
pkgver=3.1.4
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
_name="${pkgname#kwin-}"
url="https://github.com/Bismuth-Forge/${_name}"
license=('MIT')
depends=('systemsettings')
makedepends=('cmake' 'ninja' 'esbuild' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
options=('!emptydirs')

_snapshot="${_name}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('216d8f5a6c649e4950989b2d7e100fe23832311328b970b8e32985c1ef25b0b5')

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
    local licenses="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${licenses}"
    cp -rt "${licenses}" ./*
}
