# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=whosthere
pkgver=0.9.0
pkgrel=1
pkgdesc='Local Area Network discovery tool'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ramonvermeulen/whosthere"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fd25bb59d5ec084f10e28e46f81ce61087099ed20932f991cc09a28d32b6483742414862d1f941bb7a2c80593f3d9367a5fc5bf3891f6e361a211fb42c5eeb39')

prepare() {
	cd "${pkgname}-${pkgver}"
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd "${pkgname}-${pkgver}"
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-linkmode=external -X main.versionStr=${pkgver}" -o build
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "build" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
