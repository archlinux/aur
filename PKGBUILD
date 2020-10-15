# Maintainer: spider-mario <spidermario@free.fr>
pkgname=hdr-plus-git
pkgver=r212.09890d7
pkgrel=1
pkgdesc="Burst photography pipeline based on Google’s HDR+"
arch=('x86_64')
url="https://github.com/timothybrooks/hdr-plus"
license=('custom:MIT')
depends=('libraw' 'halide')
makedepends=('git' 'cmake')
provides=('hdr-plus')
source=('git+https://github.com/timothybrooks/hdr-plus.git'
        'fixes.patch'
        'unneeded-dependencies.patch')
b2sums=('SKIP'
        'e3bd4e1469685097da68e74bad02bc61671d41461400586168800dcaff395428b8b3b363457ed40d3c1f20626d180d24efac1be4ffe4b90e4d500b2979bb9c90'
        '33f1faf4ef2ac7df32e399d212a60b97b9e4099517f69522860262d50889e3bb8c867c359f72992cbeec89524377db9c11abd293e6eba0a4b2c6d341a54d660a')

pkgver() {
	cd hdr-plus
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd hdr-plus
	git apply -3 "$srcdir"/fixes.patch
	git apply -3 "$srcdir"/unneeded-dependencies.patch
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir"/hdr-plus
	make
}

package() {
	cd build
	for executable in hdrplus stack_frames; do
		install -Dm755 "$executable" "$pkgdir/usr/bin/$executable"
	done

	cd "$srcdir"/hdr-plus
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.md
}
