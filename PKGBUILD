pkgname=libtorrent-rasterbar-1
pkgver=1.2.18
pkgrel=1
pkgdesc="Open source C++ library implementing the BitTorrent protocol."
url="https://libtorrent.org/"
arch=('x86_64')
license=('BSD')
depends=('boost-libs' 'openssl')
makedepends=('boost' 'cmake' 'ninja' 'python-setuptools')
_name="${pkgname%-1}"
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
options=('!emptydirs')

_repo="${_name%-rasterbar}"
_snapshot="${_repo}-${pkgver}"

source=("${_snapshot}.tar.gz::https://github.com/arvidn/${_repo}/archive/v${pkgver}.tar.gz")
sha256sums=('c4213bfb695db3e3b266be71865a7942f9007200aa4021946818fdc5e5e4a3d3')

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -Dpython-bindings=ON \
        -Dboost-python-module-name="python" \
        -Dpython-egg-info=ON

    ninja -C "build"
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}" ninja -C "build" install

    cd "${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}
