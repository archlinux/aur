# Maintainer: Haochen Tong <i at hexchain dot org>

pkgname=elvish-git
_pkgname=elvish
pkgver=0.12.r508.g14121baa
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
    ( set -o pipefail;
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir"

    mkdir -p build/src/github.com/elves
    ln -sf "$srcdir/$_pkgname" build/src/github.com/elves/
}

build() {
    export GOPATH="$srcdir/build"
    cd "$GOPATH/src/github.com/elves/elvish"
    go get \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-X github.com/elves/elvish/buildinfo.Version=$pkgver \
        -extldflags ${LDFLAGS}" .
}

check() {
    export GOPATH="$srcdir/build"
    cd "$GOPATH/src/github.com/elves/elvish"
    make test
}

package() {
    install -Dm755 "$srcdir/build/bin/elvish" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
