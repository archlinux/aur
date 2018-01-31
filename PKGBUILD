# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=swift-protobuf-git
pkgver=1.0.2
pkgrel=1
epoch=0
pkgdesc="Plugin and runtime library for using protobuf with Swift."
arch=('i686' 'x86_64')
url="https://github.com/apple/swift-protobuf"
license=('Apache-2.0')
depends=('protobuf' 'swift-language')
makedepends=()
checkdepends=()
optdepends=()
provides=('swift-protobuf')
conflicts=()
replaces=()
backup=()
options=()

source=("swift-protobuf::git+https://github.com/apple/swift-protobuf.git")
md5sums=('SKIP')

validpgpkeys=()

pkgver() {
    cd "$srcdir/swift-protobuf"
    version=$(git tag -l | tail -n 1)
    digest=$(git describe --long --all)
    release=$(sed "s/heads\/master/$version/" <<< $digest)
    echo $release
}

package() {
    cd $srcdir/swift-protobuf

    version=$(git tag -l | tail -n 1)
    git checkout tags/$version

    swift build -c release -Xswiftc -static-stdlib
}

install() {
    target=protoc-gen-swift
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/swift-protobuf/.build/release/$target $pkgdir/usr/bin
    chmod +x $pkgdir/usr/bin/$target
}
