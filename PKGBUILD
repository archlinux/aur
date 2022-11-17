# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emilio Reggi <nag@mailbox.org>

pkgname=llama
pkgver=1.1.1
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/antonmedv/llama"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fbe387c567d4be018c7b031a87c311d866fb892a306c8d0619e5ce800a466bb6')

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
	go build -o build \
		-ldflags "-linkmode=external -extldflags \"${LDFLAGS}\""
}

package() {
	cd "$pkgname-$pkgver"
	install -Dv build/llama -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
