# Maintainer: Hein Puth (Warky Devs)
pkgname=WKMailSync
_pkgsrc="WkMailSync"
pkgver=1.0.3
pkgrel=1
pkgdesc="Mail synchronization and backup tool - IMAP/Maildir sync and export"
arch=('x86_64')
url="https://github.com/Warky-Devs/WkMailSync"
license=('GPL-3.0-only')
depends=('glibc')
options=('!debug')
makedepends=('go>=1.22.0')
source=("$_pkgsrc-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ebf7c583bac8084b041b0bdfbfd7dba4d4e260dbd2796820b087d799b6d9d6da')

build() {
    cd "$_pkgsrc-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="$srcdir/go"
    go build -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\"" \
        -o "$pkgname" ./cmd/WKMailSync
}

package() {
    cd "$_pkgsrc-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
