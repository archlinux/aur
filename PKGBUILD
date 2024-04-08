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
sha512sums=('a1d0ad86aa8e6d720575daf7e833c3b787ac51595774b99b6fd4a8ece616150c2e2c174aa97a2bc0b89e16d6cd93ec0c0d657430c1a41bf08b121368af0a4abc'
            '13e286cf091b284d15888a959a8be5a90977bed92d861fd72d465199bd6112641b47d74a525d4100868d528a25921958e9ab579643b705befe48e5756ffa301f'
            '2d3f96c90cfa355797c4ebed9e5568d53f7fe7a1a225007908ea356c0a808cef856004b411b91beb2311102c3c77ea2eed37f3b8b2a9c057b8905c1d21d06383')

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
