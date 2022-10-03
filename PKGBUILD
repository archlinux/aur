# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
pkgname=klepto
pkgver=0.4.0
pkgrel=1
pkgdesc="A tool that copies and anonymises data from other sources."
arch=("x86_64")
url="https://github.com/hellofresh/klepto"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellofresh/klepto/archive/v${pkgver}.tar.gz")
sha512sums=("60cba4940538914c2f9cc18337fc2869f3dc17a67d29c804d436b1cbdbfd03e84c92d9ac0a605bf7af5c0ae310850cb5d8e1589a7783e68910525350165f9826")

build() {
    export CGO_ENABLED=1
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE="on"
    cd "$srcdir/$pkgname-$pkgver"
    go build -a -v
}

check() {
    export CGO_ENABLED=1
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GO111MODULE="on"
    cd "$srcdir/$pkgname-$pkgver"
    go test -cover ./... -coverprofile=coverage.txt -covermode=atomic
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -m755 klepto "$pkgdir/usr/bin"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
