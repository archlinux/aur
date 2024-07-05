# Maintainer: Tomas <me+aur at wereii.cz>

pkgname=hobbits
pkgver=0.54.1
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

sha256sums=('ed3d8aeeb58ca3b4b34bbd446cc2c5f72ba22988ab793557d0fec5f82296407a'
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
