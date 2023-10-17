# Maintainer: otreblan <otreblain@gmail.com>

pkgname=glsl_analyzer
pkgver=1.2.2
pkgrel=1
pkgdesc='Language server for GLSL (autocomplete, goto-definition, formatter, and more)'
arch=('x86_64')
url="https://github.com/nolanderc/glsl_analyzer"
license=('GPL3')
depends=('glibc')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e9757b5dd96f7b8f94d884889586014a7278f4f74d180daf3d0f5073ca5e8f66')

prepare() {
	cd "$pkgname-$pkgver"

	sed -i "s/b.exec(&.{ \"git\", \"describe\", \"--tags\" })/\"v$pkgver\"/" build.zig
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
