# Maintainer: Gaetan Bisson <bisson@archlinux.org
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=xplanet-svn
_pkgname=xplanet
pkgver=20191013.220
pkgrel=1
pkgdesc='Renders an image of the earth into the X root window'
url='http://xplanet.sourceforge.net/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
makedepends=('subversion')
depends=('pango' 'giflib' 'libtiff' 'libxss')
source=("${_pkgname}::svn://svn.code.sf.net/p/xplanet/code/trunk")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
        cd "${srcdir}/${_pkgname}"
        svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	sed 's: -I`$FREETYPE_CONFIG --prefix`/include::g' -i acinclude.m4
	aclocal && autoconf && automake --add-missing
}

build() {
	cd "${srcdir}/${_pkgname}"
	export FREETYPE_CONFIG="/usr/bin/pkg-config freetype2"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make prefix="${pkgdir}"/usr install
}
