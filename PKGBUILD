pkgname=got
_pkgname=got
pkgver=0.3.0
pkgrel=2
pkgdesc='Simple golang package and CLI tool to download large files faster than cURL and Wget!'
arch=('x86_64' 'arm64')
url="https://github.com/melbahja/$pkgname"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('38f3d6c394a1edc14731a60b5efeb886e72b071a0aa830fc536598b8d479392a')

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
