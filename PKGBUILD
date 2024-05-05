# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=topfew
pkgver=1.0.0
pkgrel=1
pkgdesc="Finds the field values (or combinations of values) which appear most often in a stream of records."
arch=('x86_64')
url="https://github.com/timbray/topfew"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timbray/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac277366c1f12e88b7a050a11d8eb35b1b518b1b94b0ec58a34ff935f76d9269')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./...
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/"$pkgname" "$pkgdir"/usr/bin/tf
	install -Dm644 doc/tf.1 "$pkgdir"/usr/share/man/man1/tf.1
}
