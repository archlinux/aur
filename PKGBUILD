# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatmkfn-git
pkgver=r135.1c05016
pkgrel=1
pkgdesc='Generate font descriptions for Neatroff'
arch=('i686' 'x86_64')
url='https://dev.rudi.ir/'
license=('ISC')
depends=('gsfonts-type1')
makedepends=('git')
provides=("${pkgname-*}")
conflicts=("${pkgname-*}")
replaces=('mktrfn')
source=("$pkgname::git+https://github.com/aligrudi/neatmkfn")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/NimbusSansNarrow-BoldOblique/NimbusSansNarrow-BdOblique/g' gen.sh
}

build() {
	cd "$srcdir/$pkgname"
	make all
	## Generate fonts descriptions for neatroff:
	mkdir fonts
	## Ghostscript Fonts Location:
	FP="/usr/share/fonts/Type1/"
	./gen.sh $FP fonts
	sed -i 's|./mkfn|neatmkfn|g' gen.sh
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 mkfn $pkgdir/usr/bin/neatmkfn
	install -D -m644 gen.sh $pkgdir/usr/share/doc/${pkgname%-*}/gen.sh
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
	mkdir -p $pkgdir/usr/share/neatroff/font/devutf/
	cp $srcdir/$pkgname/fonts/* $pkgdir/usr/share/neatroff/font/devutf/
}
