# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jamovi-rbundle
pkgver=2017.09.25
pkgrel=1
epoch=
pkgdesc="R Bundle for Jamovi"
arch=('any')
url="http://www.jamovi.org"
license=('GPL')
depends=('r')
makedepends=('nodejs' 'r')
source=("rbundle.R"
	"rbundleJMV.R"
	"git+https://github.com/jamovi/jamovi-compiler.git"
	"git+https://github.com/jamovi/jmv.git"
        )
noextract=()
md5sums=('47804c91eefab8d14f3ad1af7486e11f'
         '7e1ed80a57388f65fe5bf071ee1c877e'
         'SKIP'
         'SKIP')
validpgpkeys=()

build() {
	# jmvcore
	cd $srcdir
	mkdir -p jmvcoreBundle/base/R
	Rscript $srcdir/rbundle.R $srcdir/jmvcoreBundle/base/R

	# jmv
	mkdir -p jmvBundle
	mkdir -p $srcdir/jmv/build/R #If jmv/build/R has dependencies, jmc will not try to install deps;
	## Necessary, because jmc fails to build the deps for some reason
	Rscript $srcdir/rbundleJMV.R $srcdir/jmv/build/R
	
	cd $srcdir/jamovi-compiler
	npm install ./
	
	cd $srcdir/jmv/
	node ../jamovi-compiler/index.js --install ./ --to $srcdir/jmvBundle/ --home /usr/lib/jamovi
	
}

package() {
	# jmvcore
	mkdir -p $pkgdir/usr/lib/jamovi/Resources/modules
	cp -r $srcdir/jmvcoreBundle/base $pkgdir/usr/lib/jamovi/Resources/modules/

	# jmv
	cp -r $srcdir/jmvBundle/jmv $pkgdir/usr/lib/jamovi/Resources/modules/
	rm -rf $pkgdir/usr/lib/jamovi/Resources/modules/jmv/R/jmvcore
}
