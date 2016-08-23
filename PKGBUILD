# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=astc-encoder-git
pkgver=r8.a1b3a96
pkgrel=1
pkgdesc="An ASTC (Adaptive Scalable Texture Compression) encoder and decoder"
arch=('i686' 'x86_64')
url="https://github.com/ARM-software/astc-encoder"
license=('CUSTOM')
depends=('openexr')
makedepends=('clang')
options=()
source=("git+https://github.com/ARM-software/astc-encoder.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/astc-encoder"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/astc-encoder/Source"
    sed -i -- 's/g++/clang++/g' Makefile
    make
    clang++++ exr_to_htga.cpp $(pkg-config --cflags --libs OpenEXR) -o exr_to_htga
}

package() {
    cd "$srcdir/astc-encoder/Source"
    install -Dm755 astcenc "$pkgdir/usr/bin/astcenc"
    install -Dm755 exr_to_htga "$pkgdir/usr/bin/exr_to_htga"
    install -Dm644 ../license.txt "$pkgdir/usr/share/licenses/astc-encoder-git/LICENSE"
}
