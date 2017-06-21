# Maintainer: yubimusubi
pkgbase=3dstool
pkgname=('3dstool')
pkgver=1.0.26
pkgrel=0
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
    '3c2288bac0d7a3d96416290c4032e5fc38776cef3ebfe0cb10d3faf14aab66f2'
    '14cca789693c1c08ac435456bdd24c3e76c872cb02c1816cb021333c440d2786'
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
