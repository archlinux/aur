# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=godef
pkgver=1.1.2
pkgrel=3
pkgdesc='Print where symbols are defined in Go source code.'
arch=('x86_64')
url="https://github.com/rogpeppe/godef"
license=('BSD-3-Clause')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"${pkgname}-128.patch::${url}/pull/128.patch")
sha256sums=('48a1680e9a7db28f19c4b5716402c615bbab454c769c28d9e373df75bde48b9c'
            'dcaf6eb70f023ef46817d4bbda41f6972d991ce45429112f2868179a618d45d6')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < ../"${pkgname}-128.patch"
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v -o "$pkgname"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README' -t "$pkgdir/usr/share/doc/$pkgname"
}
