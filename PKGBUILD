_name=libtorrent-rasterbar
pkgname=${_name}-1
pkgver=1.2.20
pkgrel=1
pkgdesc="Open source C++ library implementing the BitTorrent protocol."
url="https://libtorrent.org/"
arch=('x86_64')
license=('BSD-3-Clause')
depends=('boost-libs' 'openssl')
makedepends=('boost' 'cmake' 'python-setuptools')
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
options=('!emptydirs')

_repo='libtorrent'
_snapshot="${_repo}-${pkgver}"

source=(
    "https://github.com/arvidn/${_repo}/archive/v${pkgver}/${_snapshot}.tar.gz"
    '01-python-fix.patch' # https://github.com/arvidn/libtorrent/issues/7553
)
sha256sums=(
    '6243d87e54c8d3c9336af1f8ef3fedf7b54e03c2be105a9914f07ec5059e4743'
    '742c1b267ea9022e5bc8ed765a6215b147984c75e84cbe84cd2061263b5a25eb'
)

prepare() {
    for p in *.patch; do
        patch -p1 -d "${_snapshot}" < "${p}"
    done
}

build() {
    cmake -B 'build' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -Dpython-bindings=ON \
        -Dboost-python-module-name='python' \
        -Dpython-egg-info=ON

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
