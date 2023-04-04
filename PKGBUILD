# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=abroot
pkgver=1.4.4
pkgrel=1
pkgdesc='Utility that allows fully atomic transactions between 2 root partitions'
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/ABRoot'
license=(GPL3)
depends=(glibc)
makedepends=(go)
source=("ABRoot-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('a82493d323cb779082a7a92a7ec050115b8b24062e7f64c11a7f466920088b82cda706fa2973ca9da14682e80e8f1013f09bcde275e22535a2255d3c9605dd03')

prepare(){
	cd "ABRoot-${pkgver}"
	mkdir -p build/
}

build() {
	cd "ABRoot-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build
}

check() {
	cd "ABRoot-${pkgver}"
	go test
}

package() {
	cd "ABRoot-${pkgver}"
	install -Dm755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
