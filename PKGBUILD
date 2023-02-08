_name=bismuth
pkgname=kwin-${_name}
pkgver=3.1.4
pkgrel=3
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Bismuth-Forge/${_name}"
license=('MIT')
depends=('systemsettings')
makedepends=('cmake' 'npm' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
options=('!emptydirs')

_snapshot="${_name}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('216d8f5a6c649e4950989b2d7e100fe23832311328b970b8e32985c1ef25b0b5')

prepare() {
    local ver
    ver="$(sed -En 's/.*"esbuild": "(.+)".*/\1/p' "${_snapshot}/package.json")"
    test -n "${ver}"
    npm i -E --ignore-scripts --prefix=. --include=optional "esbuild@${ver}"
}

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DUSE_TSC=OFF \
        -DBUILD_TESTING=OFF

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/LICENSES/"*
}
