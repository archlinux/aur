# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=backscrub-git
pkgver=v0.3.0.r63.g4f70bc1
pkgrel=1
pkgdesc="Virtual video device (webcam) for background replacement / blurring"
arch=('i686' 'x86_64')
url="https://github.com/floe/backscrub"
makedepends=(
	'cmake'
)
depends=(
    'libcurl-gnutls'
    'opencv'
    'v4l2loopback-dkms'
)
license=('Apache')
provides=("backscrub")
conflicts=("backscrub")
source=("$pkgname::git+https://github.com/floe/backscrub.git"
        "tensorflow::git+https://github.com/tensorflow/tensorflow")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    ls "$srcdir"
    cmake \
        -B "${pkgname}/build" \
        -S "${pkgname}" \
        -DTENSORFLOW:PATH="$srcdir/tensorflow" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    cmake --build "${pkgname}/build"
}

package() {
    DESTDIR="$pkgdir" cmake \
        --build "${pkgname}/build" \
        --target install
}
