# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-extra-cursor-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="Material Based Cursor Theme: More Bibata!"
arch=('any')
url="https://github.com/ful1e5/Bibata_Extra_Cursor"
license=('GPL3')
depends=('libxcursor' 'libpng')
makedepends=('python-clickgen')
provides=("${pkgname%-theme}")
conflicts=("${pkgname%-theme}")
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-bitmaps-$pkgver.zip::$url/releases/download/v$pkgver/bitmaps.zip")
noextract=("$pkgname-bitmaps-$pkgver.zip")
sha256sums=('e5c2b0e3960f10df8281681a5ada914f2cf89480abc0c17fd8b677015a9d6ea7'
            'b44127f133ba12a09a389bda500ed6f4e2acb62ab3e1d906562ff2512c25c16d')

prepare() {
	cd Bibata_Extra_Cursor-$pkgver
	mkdir -p bitmaps
	bsdtar -xf "$srcdir/$pkgname-bitmaps-$pkgver.zip" -C bitmaps

	rm -rf themes
}

build() {
	cd Bibata_Extra_Cursor-$pkgver/builder
	_themes='DarkRed DodgerBlue Pink Turquoise'
	_sizes='22 24 28 32 40 48 56 64 72 80 88 96'

	set -- ${_sizes}
	for t in ${_themes}; do
		python build.py unix -p "../bitmaps/Bibata-Modern-$t" --xsizes ${_sizes[@]}
		python build.py unix -p "../bitmaps/Bibata-Original-$t" --xsizes ${_sizes[@]}
	done
}

package() {
	cd Bibata_Extra_Cursor-$pkgver
	install -d "$pkgdir"/usr/share/icons
	cp -r themes/Bibata-* "$pkgdir"/usr/share/icons
}
