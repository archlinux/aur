# Maintainer: justbispo <aur.fyxy0@slmail.me>
# Maintainer: Renge <renge At renge.io>

pkgname=open-in-mpv
pkgver=2.3.0
pkgrel=1
pkgdesc="Handler for open-in-mpv, a simple web extension which helps open video in mpv."
arch=('x86_64')
url="https://github.com/Baldomo/${pkgname}"
license=('GPL3')
depends=('mpv')
makedepends=(
  'go'
  'make'
)
source=("$pkgname-$pkgver.zip::https://github.com/Baldomo/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('0af6b17ca42522e227695da5723c69df9bce7a90d745b47f4a6f66b7db70840a')

prepare(){
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
 	go build -o build ./cmd/...
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
