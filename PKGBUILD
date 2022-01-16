pkgname=libtorrent-rasterbar-1
pkgver=1.2.15
pkgrel=1
pkgdesc="A C++ BitTorrent library that aims to be a good alternative to all the other implementations around"
url="https://www.rasterbar.com/products/libtorrent/"
arch=('x86_64')
license=('BSD')
depends=('boost-libs' 'openssl')
makedepends=('boost' 'cmake' 'ninja' 'python-setuptools')
provides=('libtorrent-rasterbar=1.2.15')
conflicts=('libtorrent-rasterbar')
options=('!emptydirs')

_snapshot="libtorrent-rasterbar-${pkgver}"
_archive="${_snapshot}.tar.gz"

source=("${_archive}::https://github.com/arvidn/libtorrent/releases/download/v${pkgver}/${_archive}")
sha512sums=('c409c53ec9c299a05b51ab61d7df1209803cbd6070f0a014dd6fb42c30f6f5230ea90848330f901c61816bc70901e618409acacc95bb0e5acb7f81211d001fa2')

build() {
    mkdir -p "${srcdir}/build" && cd "$_"

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -Dpython-bindings=ON \
        -Dboost-python-module-name="python" \
        -Dpython-egg-info=ON \
        -GNinja "${srcdir}/${_snapshot}"

    ninja
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" ninja install

    cd "${srcdir}/${_snapshot}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}
