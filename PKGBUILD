# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <aur a snilius d com>

pkgname=migrate

pkgver=v3.3.0.r3.g6070aa8
pkgrel=1
pkgdesc="Database migration handling in Golang"
url="https://github.com/golang-migrate/migrate"
license=('MIT')
arch=('x86_64' 'i686')
makedepends=('go', 'dep')
options=('!strip' '!emptydirs')
depends=()
makedepends=()

source=(git://github.com/golang-migrate/migrate.git)
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    GOPATH="$srcdir/gopath"
    mkdir -p "$GOPATH/src/github.com/golang-migrate"
    mv "$srcdir/migrate" "$GOPATH/src/github.com/golang-migrate"
    cd "$GOPATH/src/github.com/golang-migrate/migrate"
    dep ensure -v
    cd $srcdir
    go install -v github.com/golang-migrate/migrate/cli
}

package() {
    GOPATH="$srcdir/gopath"
    install -Dm755 "$GOPATH/bin/cli" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$GOPATH/src/github.com/golang-migrate/migrate/LICENSE" "$pkgdir/usr/share/licenses/migrate/LICENSE"
}
