# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=bibata-extra-cursor-theme
pkgver=0.3
pkgrel=2
pkgdesc="Material Based Cursor Theme: More Bibata!"
arch=('any')
url="https://github.com/ful1e5/Bibata_Extra_Cursor"
license=('GPL3')
makedepends=('python-pillow' 'inkscape' 'xorg-xcursorgen')
provides=('bibata-extra-cursor')
conflicts=('bibata-extra-cursor')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cb43593b189b4dbfaa6e2a83c5c401fac8fc02b268f36a3873fa107b90087f93')

prepare() {
	cd Bibata_Extra_Cursor-$pkgver

	# Remove pre-compiled resources
	rm -rf Bibata*/out/
}

build() {
	cd Bibata_Extra_Cursor-$pkgver

	_variants=(Bibata_Dark_Red Bibata_Dodger_Blue Bibata_Pink Bibata_Turquoise)

	for variant in ${_variants[*]}; do
		echo "Building $variant..."
		python render-cursors.py ./src/$variant/source-cursors.svg -o -a --name $variant
		./tweak.sh $variant
		./x11-make.sh $variant
		cp src/$variant/*.theme $variant/out/X11/$variant
	done
}

package() {
	cd Bibata_Extra_Cursor-$pkgver
	install -d "$pkgdir/usr/share/icons"

	_variants=(Bibata_Dark_Red Bibata_Dodger_Blue Bibata_Pink Bibata_Turquoise)

	for variant in ${_variants[*]}; do
		cp -a $variant/out/X11/$variant "$pkgdir/usr/share/icons"
	done
}
