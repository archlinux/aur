# Maintainer: Andrew Grechkin <andrew.grechkin@gmail.com>
# Contributor: Andrew Grechkin <andrew.grechkin@gmail.com>

# shellcheck disable=SC2034,SC2154,SC2164

_pkgname=fuse3-p7zip
pkgname="$_pkgname-git"
pkgver=2.2.1
pkgrel=1
pkgdesc="fuse3 file system that uses the 7zip library to mount archives"
arch=('x86_64')
url="https://github.com/andrew-grechkin/$_pkgname"
license=('GPL')
depends=('fuse3' '7zip')
makedepends=('cmake' 'git' 'go-md2man')
source=("git+$url")
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname"

    # package only latest tag, not HEAD in main branch if it's not tagged
    git fetch --tags

    local _latest_tag
    _latest_tag=$(git describe --tags --abbrev=0)

    git -c advice.detachedHead=false checkout "$_latest_tag"

    git submodule update --init
}

pkgver() {
    cd "$_pkgname"

    git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
    cd "$_pkgname"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -S . -B "build-release"
    make -j -C "build-release"
    go-md2man -in=README.md -out="${_pkgname}.1"
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install -C "build-release"
    install -Dm644 "${_pkgname}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
}
