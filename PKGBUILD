# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
pkgname=klepto
pkgver=0.4.5
pkgrel=1
pkgdesc="A tool that copies and anonymises data from other sources."
arch=("x86_64")
url="https://github.com/hellofresh/klepto"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellofresh/klepto/archive/v${pkgver}.tar.gz")
sha512sums=("6758a38bacea173c4f50f24cdb9e9d5765181be3d515ea683ac83745579b436e9ea46f1166a30ea1992c9ecbd6223ebb34b71fb92764370778b669755f082af3")

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
