# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Artem Trokhycmhuk <yuc44w68t at relay dot firefox dot com>

pkgname=noverify
pkgver=0.5.2
pkgrel=1
pkgdesc="PHP7/8 code linter"
arch=('x86_64' 'aarch64')
url="https://github.com/VKCOM/noverify"
license=('MIT')
makedepends=('go')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('060272a4709fa88cd1a4d2aa213bfd2b2e4479ab806ec1831a5fff7797f18612')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	local _PKG="${url#https://}/src/cmd"

	cd "$pkgname-$pkgver"
	go build -o build -ldflags "-linkmode=external -X $_PKG.BuildVersion=$pkgver"
}

check() {
	cd "$pkgname-$pkgver"
	go test -race -short ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
