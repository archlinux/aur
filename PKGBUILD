# Maintainer: yubimusubi
pkgname=('3dstool-git')
provides=('3dstool')
pkgver=r73.344f109
pkgrel=1
pkgdesc="An all-in-one tool for extracting/creating 3ds roms."
arch=('i686' 'x86_64')
url="https://github.com/dnasdw/3dstool"
license=('unknown') # FIXME
makedepends=('git' 'cmake')
options=('!strip')

source=(
    "$pkgname::git+https://github.com/dnasdw/3dstool.git"
    '00-3dstool-share-ignore.patch'
)

sha256sums=(
    'SKIP'
    '3d55e1bb49caa79648cd27aacba3793cfa38882cd740661560bc3d0d68da8d3d'
)

pkgver() {
    cd "$pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"

    # Move ignore file into /usr/share
    patch -p1 < ../00-3dstool-share-ignore.patch
}

build() {
    cd "$pkgname"

    # This is straight from the README
    mkdir -p project
    cd project
    cmake ..
    cmake ..
    make
}

package() {
    cd "$pkgname/project"
    make install # Actually installs to "../bin"
    install -d "$pkgdir/usr/bin/"
    install "../bin/3dstool" "$pkgdir/usr/bin/"

    # Move ignore file into /usr/share
    install -d "$pkgdir/usr/share/3dstool"
    install "../bin/ignore_3dstool.txt" "$pkgdir/usr/share/3dstool"
}
