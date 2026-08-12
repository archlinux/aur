# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=whosthere
pkgver=0.8.3
pkgrel=1
pkgdesc='Local Area Network discovery tool'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ramonvermeulen/whosthere"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('76aee769d1eada7c13695b56d573876d7758e7435d08518ed5d5169b9e15a44f6bf41cd2145419243832e62fc7659cf729b50134f35de5146c2e11d595cb2ab4')

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
