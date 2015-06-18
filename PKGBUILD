# Maintainer: Fabio Zanini <fabio.zanini@tuebingen.mpg.de>
pkgname=stampy
pkgver=1.0.23
pkgrel=1
pkgdesc="Mapper of short reads from illumina sequencing machines onto a reference genome"
arch=('i686' 'x86_64')
url="http://www.well.ox.ac.uk/project-stampy"
license=('custom')
depends=('python2')
makedepends=('gcc')
source=(http://www.well.ox.ac.uk/bioinformatics/Software/Stampy-latest.tgz)
md5sums=('30bbfc2c4a2750f6cc87bbfe52394dcd')

build() {
 	echo $srcdir
	cd "$srcdir/$pkgname-$pkgver"
	# Python2 fix
	sed -i 's/python?=python/python?=python2/' makefile

	# g++ obsolete option fix
	sed -i 's/-Wl /-Wall /' makefile

	make

	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' stampy.py
	# FIXME: Substitute all TABS by spaces
	sed -i 's/	/        /g' stampy.py

}

package() {
	# Install manually
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/stampy"
	cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/opt"
	ln -s "$pkgdir/opt/$pkgname-$pkgver/stampy.py" "$pkgdir/usr/bin/stampy"

	# Install license
	sed -n '/This is a release version/,/support./p' "$srcdir/$pkgname-$pkgver/README.txt" > "$pkgdir/usr/share/licenses/stampy/LICENSE"
}
