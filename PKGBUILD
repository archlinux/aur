# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=steamgrid
pkgver=3.4.0
pkgrel=1
pkgdesc="Downloads images to fill your Steam grid view"
arch=(x86_64)
url="https://github.com/boppreh/steamgrid"
license=("custom:MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/boppreh/steamgrid/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b357a6b5494359a9127a90bf9084973d279682e2830bfaacb8d1e684da1b532fd554b8dba6c59161438a8084ee02a5999a0856cad2dce434fcfa52e1ffc0ea45')


prepare() {
    cd "$pkgname-$pkgver"

    rm -f go.mod go.sum

    go mod init "${url#https://}"
    go mod tidy
}

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build .
}

package() {
	cd "$pkgname-$pkgver"

    install -Dm755 steamgrid "$pkgdir/usr/bin/steamgrid"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
