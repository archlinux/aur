# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=steamgrid
pkgver=3.3.0
pkgrel=1
pkgdesc="Downloads images to fill your Steam grid view"
arch=(x86_64)
url="https://github.com/boppreh/steamgrid"
license=("custom:MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/boppreh/steamgrid/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c5f419dc16c811506ba907a972449f355bfb347259064bafc93904494d08856c400f23d656632191e76ad7a5b4ba61b0d01679c35c26fa7d31a2c03a2f9f4bdb')


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
