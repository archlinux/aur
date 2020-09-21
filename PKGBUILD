# Maintainer: Tharre <tharre3@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=age
_pkgver=1.0.0-beta5
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='A simple, modern and secure file encryption tool'
arch=('x86_64')
url="https://github.com/FiloSottile/$pkgname"
license=('BSD')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('6d1000e233ae1011ca44ed73c72d6ffd564c4c728eb0b53ed380ca24df1f5673')

prepare() {
    cd "$pkgname-$_pkgver"
    export GOPATH="$srcdir"
    go mod download
}

build() {
    cd "$pkgname-$_pkgver"
    export GOPATH="$srcdir"
    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-extldflags \"$LDFLAGS\"" \
      -o . ./...
}

check() {
    cd "$pkgname-$_pkgver"
    export GOPATH="$srcdir"
    go test ./...
}

package() {
    cd "$pkgname-$_pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" age age-keygen
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
