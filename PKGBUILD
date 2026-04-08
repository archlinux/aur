# Maintainer: Hein Puth (Warky Devs)
pkgname=wkmailsync
_pkgsrc="WkMailSync"
pkgver=1.0.9
pkgrel=1
pkgdesc="IMAP/Maildir mail sync and backup tool with EML/ZIP export and Virtualmin support"
arch=('x86_64' 'aarch64')
url="https://github.com/Warky-Devs/WkMailSync"
license=('GPL-3.0-only')
depends=('glibc')
options=('!debug')
makedepends=('go')
keywords=('mail' 'imap' 'maildir' 'sync' 'backup' 'email' 'virtualmin')
source=("$_pkgsrc-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bfdafe775d789834b45bddba417ee8358329ee968b718ed2b45ffd1af2d8eabc')

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
        -o "$pkgname" ./cmd/wkmailsync
    chmod -R u+w "$srcdir/go/pkg/mod" 2>/dev/null || true
}

package() {
    cd "$_pkgsrc-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
