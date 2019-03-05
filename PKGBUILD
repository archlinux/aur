# Maintainer: shimi <shimi.chen@gmail.com>
# Contributor: Marios Abatis <marios.archlinux@gmail.com>
pkgname=gnome-chemistry-utils
pkgver=0.14.17
_majorver=$(echo ${pkgver}|cut -c1-4)
pkgrel=1
pkgdesc="Gnome Chemistry Utilities (gcu). Includes gchempaint, a tool to draw molecules."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gchemutils/"
license=('GPL')

provides=('gchempaint' 'gchemcalc' 'gcrystal' 'gchem3d' 'gchemtable' 'gspectrum')
conflicts=('gnome-chemistry-utils-devel')
depends=('bodr' 'libglade' 'goffice>=0.10.0' 'gtkglext' 'openbabel' 'hicolor-icon-theme' 'dconf')
	##Already fulfilled dependencies:
	#gconf required by goffice
	#libgsf required by goffice
	#cairo required by gtk3 required by goffice
	#shared-mime-info required by gtk3 required by goffice
makedepends=('pkgconfig' 'intltool' 'gettext' 'gnome-doc-utils' 'boost' 'desktop-file-utils')
optdepends=('yelp: Viewing help manuals' \
	    'gnumeric>1.12.0: gnumeric plugin'\
	    'gnome-doc-utils')
source=(http://download.savannah.gnu.org/releases/gchemutils/${_majorver}/${pkgname}-${pkgver}.tar.bz2 gnumeric-ftbfs.patch)
options=(!libtool)
install=gnome-chemistry-utils.install
md5sums=('961c9f1a5760abeb62204a8f5a1a9802' 'SKIP')

prepare() {
        cd $pkgname-$pkgver
        patch --forward --strip=1 --input="${srcdir}/gnumeric-ftbfs.patch"
    }

build() {

	cd ${srcdir}/${pkgname}-${pkgver}
	./configure	--prefix=/usr \
				--sysconfdir=/etc \
				--libexecdir=/usr/lib/${pkgname} \
				--disable-update-databases \
				--disable-schemas-compile
	make || return 1
}

package() {

	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install || return 1
}
