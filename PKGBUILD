# Maintainer: yubimusubi
pkgbase=3dstool
pkgname=('3dstool')
pkgver=1.0.19
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
    'c20b2a886630ace079c0b2699e5954aa75b2630def434985162b63b5e2996f6e'
    '7f5016f7edf82a6236e4cc7e9378a3c9be28ec6ea22fde3d4b5b635d78d5da9d'
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
