_name=libtorrent-rasterbar
pkgname=${_name}-1
pkgver=1.2.19
pkgrel=2
pkgdesc="Open source C++ library implementing the BitTorrent protocol."
url="https://libtorrent.org/"
arch=('x86_64')
license=('BSD')
depends=('boost-libs' 'openssl')
makedepends=('cmake' 'boost' 'python-setuptools')
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
options=('!emptydirs')

_repo='libtorrent'
_snapshot="${_repo}-${pkgver}"
_url="https://github.com/arvidn/${_repo}"

source=(
    "${_snapshot}.tar.gz::${_url}/archive/v${pkgver}.tar.gz"
    "01-${_snapshot}-python-fix.patch::${_url}/commit/932ddd3ccbb44c12b1575e5883ae20fdce353fe2.patch"
    "02-${_snapshot}-python-fix.patch::${_url}/commit/509d7e16d8f404a1cfd848703d46e5d9535d4802.patch"
)
sha256sums=(
    'c09c3f13dd6462d6ef0a5d1780ed0f73b504fcfbbdb5c6cad2cfad05daea50ba'
    'ec4e7f583b2d35afae770d1c2c8ed999278eeb7492cc8eea6d484477e32505b5'
    'c3c576a85ce6ca58802b19795151c605bb5e689ed9c2b6dbf1916c907e45599e'
)

prepare() {
    for p in *.patch; do
        patch -p1 -d "${_snapshot}" < "${p}"
    done
}

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -Dpython-bindings=ON \
        -Dboost-python-module-name="python" \
        -Dpython-egg-info=ON

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_snapshot}/COPYING"
}
