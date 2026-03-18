# Maintainer: Tomas <me+aur at wereii.cz>

pkgname=hobbits
pkgver=0.55.0
pkgrel=2
pkgdesc="A multi-platform GUI for bit-based analysis, processing, and visualization"
arch=('x86_64')
url="https://github.com/Mahlet-Inc/hobbits"
license=('MIT')
makedepends=(cmake qt5-tools libusb libpcap patchelf git)
depends=("python" qt5-base)
_dist_filename="$pkgname-$pkgver"
source=(
    "${_dist_filename}::https://github.com/Mahlet-Inc/hobbits/archive/refs/tags/v${pkgver}.tar.gz"
    "git+https://bitbucket.org/jpommier/pffft.git")

sha256sums=('2159ebf76c609258258bd6cb3b0896587950da0114c3d7e8462485582ac9f91d'
            'SKIP')

prepare() {
    cp -r "$srcdir/pffft" "${_dist_filename}/external/"
}

build() {
    cmake -B build -S "${_dist_filename}" \
        -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr' -DPFFFT_ENABLE_SIMD=1
    cmake --build build -j`nproc`
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
