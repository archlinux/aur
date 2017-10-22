# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Daniel Landau <daniel.landau@iki.fi>
# Contributor: Xyne
# Contributor: David Manouchehri <d@32t.ca>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Thomas Jost <schnouki schnouki net>
# Contributor: Hinrich Harms <arch hinrich de>

pkgbase=enigmail-git
pkgname=(icedove-${pkgbase} thunderbird-${pkgbase})
pkgver=1.9.r432.gfa5c103b
pkgrel=2
_pkgdesc="extension that enables sending and receiving signed and encrypted e-mail messages (development version)"
pkgdesc="Icedove / Thunderbird ${_pkgdesc}"
arch=('any')
url="https://www.enigmail.net/"
license=('MPL' 'GPL')
depends=('gnupg>=2.0.7')
makedepends=('git' 'zip' 'python2' 'perl>=5.8')
source=("${pkgbase}::git+https://git.code.sf.net/p/enigmail/source")
sha512sums=('SKIP')

pkgver()
{
	cd $pkgbase
	git describe --long | sed 's/enigmail-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd $pkgbase
	./configure PYTHON=/usr/bin/python2
	make -j1 # fails with -j greater than 1
}

_package_for()
{
	cd $pkgbase
	local emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' \
		package/install.rdf)"
	install -d -m755 "${pkgdir}/usr/lib/${1}/extensions/${emid}"
	bsdtar -xf build/enigmail-*.xpi \
		-C "${pkgdir}/usr/lib/${1}/extensions/${emid}"

	pkgdesc="${1^} ${_pkgdesc}"
	depends+=("${1}>=38")
	provides+=(${1}-enigmail)
	conflicts+=(${1}-enigmail)
}

package_icedove-enigmail-git()
{
	_package_for icedove
}

package_thunderbird-enigmail-git()
{
	_package_for thunderbird
}
