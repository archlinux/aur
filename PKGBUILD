pkgname=got
_pkgname=got
pkgver=0.4.0
pkgrel=1
pkgdesc='Simple golang package and CLI tool to download large files faster than cURL and Wget!'
arch=('x86_64' 'arm64')
url="https://github.com/melbahja/$pkgname"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('14d3cda145dc98f9daa6794fd6f2a402e12815b506ffb18e26f8545681d2030c')

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
