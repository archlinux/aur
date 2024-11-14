# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=yr
pkgver=0.0.6
pkgrel=1
pkgdesc="Get the weather delivered to your command-line, or use as a Go package"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url="https://git.sr.ht/~timharek/yr"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
options=("strip" "buildflags")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('97d5556582728b38e4e629dfc4515579e9f933596f41607e7a4addc3a5f8a9ad')

prepare(){
    cd "$pkgname-v$pkgver"
    mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=2
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname-v$pkgver"
	go build -o "build/$pkgname"
}

# tests not passing
check() {
	cd "$pkgname-v$pkgver"
	go test
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
