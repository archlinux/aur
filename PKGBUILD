# Maintainer: yubimusubi
pkgbase=3dstool
pkgname=('3dstool')
pkgver=1.0.15
pkgrel=1
pkgdesc="An all-in-one tool for extracting/creating 3ds roms."
arch=('i686' 'x86_64')
url="https://github.com/dnasdw/3dstool"
license=('unknown') # FIXME
depends=('openssl')
makedepends=('git' 'cmake' 'glibc') # glibc provides iconv
options=('!strip')

source=(
    "https://github.com/dnasdw/3dstool/archive/v${pkgver}.tar.gz"
    '00-3dstool-share-ignore.patch'
)
sha256sums=(
    'a90bdc6c817c045f8d9ae0319feda9c88362de9e15d32e2a8b13e5b1e793169b'
    '3d55e1bb49caa79648cd27aacba3793cfa38882cd740661560bc3d0d68da8d3d'
)

prepare() {
    cd "$pkgbase-$pkgver"

    # Move ignore file into /usr/share
    patch -p1 < ../00-3dstool-share-ignore.patch
}

build() {
    cd "$pkgbase-$pkgver"

    # This is straight from the README
    mkdir -p project
    cd project
    cmake ..
    cmake ..
    make
}

package() {
    cd "$pkgbase-$pkgver/project"
    make install # Actually installs to "../bin"
    install -d "$pkgdir/usr/bin/"
    install "../bin/3dstool" "$pkgdir/usr/bin/"

    # Move ignore file into /usr/share
    install -d "$pkgdir/usr/share/3dstool"
    install "../bin/ignore_3dstool.txt" "$pkgdir/usr/share/3dstool"
}
