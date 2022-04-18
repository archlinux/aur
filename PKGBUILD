# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
pkgname=klepto
pkgver=0.3.1
pkgrel=2
pkgdesc="A tool that copies and anonymises data from other sources."
arch=("x86_64")
url="https://github.com/hellofresh/klepto"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellofresh/klepto/archive/v${pkgver}.tar.gz")
sha512sums=("87fa60ec142180bf6a0066cdb777475bd25281f81df7dfbb2f3ef8af71ec30a23f5d8d3cdb8f5a72bc482cb984b34a28c7cdc6bcb4f293ba39010e7bb17d48ac")

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
