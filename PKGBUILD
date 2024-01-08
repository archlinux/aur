# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: William J. Bowman <aur@williamjbowman.com>

pkgname=ect
_pkgname=efficient-compression-tool
pkgver=0.9.5
pkgrel=1
pkgdesc='File compressor, supports postcompression of PNG, JPEG, GZIP and ZIP files'
url="https://github.com/fhanau/$_pkgname"
arch=('x86_64')
license=('Apache')
depends=('gcc-libs')
makedepends=('nasm' 'git' 'cmake')
source=("git+$url.git#tag=v$pkgver"
	'git+https://github.com/glennrp/libpng.git#commit=f135775ad4e5d4408d2e12ffcc71bb36e6b48551'
	'git+https://github.com/fhanau/mozjpeg.git#commit=182457e3e26e1e078d5dbd09137cf04865be2e49')
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$_pkgname"
	git submodule init
	git config submodule.src/libpng.url "$srcdir"/libpng
	git config submodule.src/mozjpeg.url "$srcdir"/mozjpeg
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -S "$_pkgname"/src \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	# Some things expect this to be an all-caps name
	ln -s ect "$pkgdir"/usr/bin/ECT
}
