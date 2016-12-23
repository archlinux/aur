# Maintainer: Haochen Tong <i at hexchain dot org>

pkgname=elvish-git
_pkgname=elvish
pkgver=r2052.a25710a
pkgrel=1
pkgdesc="A friendly and expressive Unix shell."
arch=('i686' 'x86_64')
url="https://github.com/elves/elvish"
license=('custom:2-clause BSD')
provides=('elvish')
conflicts=('elvish')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/elves/elvish.git")
md5sums=('SKIP')
install=elvish.install

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"

    mkdir -p build/src/github.com/elves
    ln -sf "$srcdir/$_pkgname" build/src/github.com/elves/
    export GOPATH="$srcdir/build"
}

build() {
    cd "$GOPATH/src/github.com/elves/elvish"
    make get
}

check() {
    cd "$GOPATH/src/github.com/elves/elvish"
    make test
}

package() {
    install -Dm755 "$srcdir/build/bin/elvish" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
