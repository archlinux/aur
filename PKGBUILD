pkgname=got
_pkgname=got
pkgver=0.2.1
pkgrel=2
pkgdesc='Simple golang package and CLI tool to download large files faster than cURL and Wget!'
arch=('x86_64' 'arm64')
url="https://github.com/melbahja/$pkgname"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('89bb388c7584c15c37940c64c6d68c431baae4d2e61f7b587fe002673df7c5b2')

prepare(){
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver/cmd/$pkgname"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-X main.version=$pkgver" \
		-o got
}

check() {
	cd "$pkgname-$pkgver"
	go test -v -race ./...
}

package() {
	cd "$pkgname-$pkgver/"
	install -Dm755 "cmd/$pkgname/$pkgname" "$pkgdir"/usr/bin/$pkgname
	install -Dm755 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
