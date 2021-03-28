# Maintainer: Jan Kohnert <bughunter@jan.kohnert.de>
pkgname=klepto
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool that copies and anonymises data from other sources."
arch=('x86_64')
url="https://github.com/hellofresh/klepto"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hellofresh/klepto/archive/v${pkgver}.tar.gz")
sha512sums=('593ec00ff0b000ddb0c37e5cfb082f61373e442d1d9f0e9a4b68e05ffc6eedcbe7365d9d43892c8fb89cfd7ea386e311d0ff74c9a41eaf086e2ab007d5e7a30d')

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
