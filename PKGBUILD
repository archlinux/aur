# Maintainer: otreblan <otreblain@gmail.com>

pkgname=glsl_analyzer
pkgver=1.4.2
pkgrel=1
pkgdesc='Language server for GLSL (autocomplete, goto-definition, formatter, and more)'
arch=('x86_64')
url="https://github.com/nolanderc/glsl_analyzer"
license=('GPL3')
depends=('glibc')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eb49f81f95f243b5d4d5b99e710ff7699cf5d9fea4f9d5b6f28d9a2ddb76d58e')

prepare() {
	cd "$pkgname-$pkgver"

	sed -i "s/b.run(&.{ \"git\", .* })/\"v$pkgver\"/" build.zig
}

build() {
	cd "$pkgname-$pkgver"

	DESTDIR="build" zig build \
		--prefix /usr \
		--search-prefix /usr \
		-Dtarget=native-linux.5.15-gnu \
		-Doptimize=ReleaseSafe \
		-Dcpu=baseline
}

check() {
	cd "$pkgname-$pkgver"

	zig build test \
		--prefix /usr \
		--search-prefix /usr \
		-Dtarget=native-linux.5.15-gnu \
		-Doptimize=ReleaseSafe \
		-Dcpu=baseline
}

package() {
	cd "$pkgname-$pkgver"

	cp -a build/* "$pkgdir"
}
