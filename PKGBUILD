# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
pkgname=klepto
pkgver=0.4.2
pkgrel=1
pkgdesc="A tool that copies and anonymises data from other sources."
arch=("x86_64")
url="https://github.com/hellofresh/klepto"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellofresh/klepto/archive/v${pkgver}.tar.gz")
sha512sums=("8db0870551da2c93964a6bcc69dacf52a46e309486d08697b54d2fd452bdebeb705b324217134f3dac2b58e72815f774c77a7c9590f60579cfae067dc648ccba")

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
