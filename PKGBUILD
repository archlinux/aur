# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emilio Reggi <nag@mailbox.org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=walk
pkgver=1.7.0
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/antonmedv/walk"
license=('MIT')
depends=('glibc')
makedepends=('go')
replaces=('llama')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b657523d637727cfa408040e9816f45ae868c5192fb3962c32a0edab9d9b00dd')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	go build -o build -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\""
}

package() {
	cd "$pkgname-$pkgver"
	install -Dv build/walk -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
