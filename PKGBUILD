pkgname=libtorrent-rasterbar-1
pkgver=1.2.15
pkgrel=1
pkgdesc="Open source C++ library implementing the BitTorrent protocol."
url="https://libtorrent.org/"
arch=('x86_64')
license=('BSD')
depends=('boost-libs' 'openssl')
makedepends=('boost' 'cmake' 'ninja' 'python-setuptools')
provides=("libtorrent-rasterbar=${pkgver}")
conflicts=('libtorrent-rasterbar')
options=('!emptydirs')

_snapshot="libtorrent-rasterbar-${pkgver}"
_archive="${_snapshot}.tar.gz"

source=("${_archive}::https://github.com/arvidn/libtorrent/releases/download/v${pkgver}/${_archive}")
sha256sums=('c8ad8638684c0a903ebabc30490079e31b1a6a638da2adec5a8bef6a0e62214b')

build() {
    cd "${srcdir}"

    cmake -B "build" -GNinja "${srcdir}/${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -Dpython-bindings=ON \
        -Dboost-python-module-name="python" \
        -Dpython-egg-info=ON

    ninja -C "build"
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" ninja install

    cd "${srcdir}/${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}
