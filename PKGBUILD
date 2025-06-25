# Maintainer: otreblan <otreblain@gmail.com>

pkgname=glsl_analyzer
pkgver=1.6.0
pkgrel=1
pkgdesc='Language server for GLSL (autocomplete, goto-definition, formatter, and more)'
arch=('x86_64')
url="https://github.com/nolanderc/glsl_analyzer"
license=('GPL3')
depends=('glibc')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4430846143ef071c19f372a1dbd0f31ff8d2bf290d3d769dd5379e459febd0fe')

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
