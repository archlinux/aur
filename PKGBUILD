pkgname=libtorrent-rasterbar-1
pkgver=1.2.17
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
sha256sums=('ccab9dde68e060fa84e8dde535975dc9aa51817d6b1cbe8d922c084fb2005417')

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
