# Maintainer: Haochen Tong <i at hexchain dot org>

pkgname=elvish-git
_pkgname=elvish
pkgver=0.12.r530.ge2a3f2d8
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

build() {
    export GOPATH="$srcdir/build"
    cd "$srcdir/$_pkgname"
    go build -trimpath \
        -ldflags "-X github.com/elves/elvish/buildinfo.Version=$pkgver \
        -extldflags ${LDFLAGS}" .

    go clean -modcache
}

check() {
    export GOPATH="$srcdir/build"
    cd "$srcdir/$_pkgname"
    make test
}

package() {
    install -Dm755 "$srcdir/$_pkgname/elvish" -t "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
