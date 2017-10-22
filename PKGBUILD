# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Daniel Landau <daniel.landau@iki.fi>
# Contributor: Xyne
# Contributor: David Manouchehri <d@32t.ca>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Thomas Jost <schnouki schnouki net>
# Contributor: Hinrich Harms <arch hinrich de>

pkgname=icedove-enigmail-git
pkgver=1.9.r432.gfa5c103b
pkgrel=1
pkgdesc="Icedove extension that enables sending and receiving signed and encrypted e-mail messages (development version)"
arch=('any')
url="https://www.enigmail.net/"
license=('MPL' 'GPL')
depends=('icedove>=38' 'gnupg>=2.0.7')
makedepends=('git' 'zip' 'python2' 'perl>=5.8')
source=("enigmail-git::git+https://git.code.sf.net/p/enigmail/source")
sha512sums=('SKIP')

pkgver()
{
	cd enigmail-git
	git describe --long | sed 's/enigmail-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd enigmail-git
	./configure PYTHON=/usr/bin/python2
	make -j1 # fails with -j greater than 1
}

package()
{
	cd enigmail-git
	local emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' \
		package/install.rdf)"
	install -d -m755 "${pkgdir}/usr/lib/icedove/extensions/${emid}"
	bsdtar -xf build/enigmail-*.xpi \
		-C "${pkgdir}/usr/lib/icedove/extensions/${emid}"
}
