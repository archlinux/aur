# Maintainer: Haochen Tong <i at hexchain dot org>

pkgname=grumpy-git
_pkgname=grumpy
pkgver=r71.61bd06c
pkgrel=1
pkgdesc="Grumpy is a Python to Go source code transcompiler and runtime."
arch=('i686' 'x86_64')
url="https://github.com/google/grumpy"
license=('Apache')
provides=('grumpy')
conflicts=('grumpy')
depends=('glibc' 'go' 'python2')
makedepends=('git' 'go' 'python2')
source=("git+https://github.com/google/grumpy.git")
md5sums=('SKIP')
options=(!strip)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/grumpy"
    sed -i -e "s|@python|@python2|" -e "s|@pip|@pip2|" Makefile
    sed -i -e "1 s|python|python2|" tools/*
}

build() {
    cd "$srcdir/grumpy"
    make
    find . -name "*.d" -delete
}

check() {
    cd "$srcdir/grumpy"
    make test
}

package() {
    cd "$srcdir/grumpy/build"
    install -dm755 "$pkgdir/usr"
    install -dm755 "$pkgdir/usr/lib/go"
    cp -rv --no-preserve='ownership' bin lib "$pkgdir/usr/"
    cp -rv --no-preserve='ownership' pkg src "$pkgdir/usr/lib/go/"
}
