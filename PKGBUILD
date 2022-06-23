# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Artem Trokhycmhuk <yuc44w68t at relay dot firefox dot com>

pkgname=noverify
pkgver=0.5.3
pkgrel=1
pkgdesc="PHP code linter"
arch=('x86_64' 'aarch64')
url="https://github.com/VKCOM/noverify"
license=('MIT')
depends=('glibc')
makedepends=('go')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('abb8ed781dcb24fdd4053ee83984a1a6cc01688ccc8b57990344e54e11d8580e')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
	go mod download
}

build() {
	local _PKG="${url#https://}/src/cmd"
	cd "$pkgname-$pkgver"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-o build \
		-ldflags "-linkmode=external -extldflags \"${LDFLAGS}\" -X $_PKG.BuildVersion=$pkgver"
}

check() {
	cd "$pkgname-$pkgver"
	go test -race -short ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
