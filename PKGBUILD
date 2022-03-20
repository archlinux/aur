pkgname=kwin-bismuth
pkgver=3.0.0
pkgrel=1
pkgdesc="Addon for KDE Plasma to arrange your windows automatically and switch between them using keyboard shortcuts, like tiling window managers."
arch=('x86_64')
_repo='bismuth'
url="https://github.com/Bismuth-Forge/${_repo}"
license=('MIT')
depends=('systemsettings')
makedepends=('npm' 'cmake' 'ninja' 'extra-cmake-modules' 'kcoreaddons' 'kconfig' 'ki18n' 'kcmutils' 'kdeclarative')
options=('!emptydirs')

_snapshot="${_repo}-${pkgver}"

source=("${_snapshot}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b8f647638a5c2bbd0cbe215fb5fb77a8783bdc278924b3dfeb39104b07e39bf1')

prepare() {
    cd "${srcdir}/${_snapshot}"
    local ver=$(perl -ne'/"esbuild":\s*"(\S+)",?/ && print $1' <"package.json")
    rm "package.json"
    npm i -E "esbuild"@"${ver}"
}

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_TSC=OFF \
        -DBUILD_TESTING=false

    ninja -C "build"
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" ninja install

    cd "${srcdir}/${_snapshot}/LICENSES"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" && cp -rt "$_" *
}
