# Author: Wintershade <Wintershade AT google mail DOT com>
# Contributor: Konrad <konrad AT knauber DOT name>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>
# Contributor: Fernando M <f <at> beford.net>

pkgname=rpm-org
pkgver=4.10.2
pkgrel=1
pkgdesc="RPM Package Manager - RPM.org fork, used in major RPM distros"
arch=('i686' 'x86_64')
url=("http://www.rpm.org/")
license=('GPL2')
depends=('lua51' 'file' 'nss' 'popt' 'elfutils' 'db')
makedepends=('python2')
conflicts=('rpm' 'rpmextract')
options=('!libtool')
provides=("rpm=${pkgver}" 'rpmextract=1.0-4')
source=(http://rpm.org/releases/rpm-4.10.x/rpm-${pkgver}.tar.bz2
	'rpmextract.sh')

md5sums=('a644aea351c9b3889bbaded5d6a377c9'
         '1f7f4f3b3a93ff6d2f600c7751ae25ef')


build() {
	cd ${srcdir}/rpm-${pkgver}
	export LUA_CFLAGS=`pkg-config lua5.1 --cflags`
	export LUA_LIBS=`pkg-config lua5.1 --libs`
	./configure --localstatedir=/var --sysconfdir=/etc  --prefix=/usr  --with-external-db --enable-python CPPFLAGS="`pkg-config --cflags nss`" PYTHON=python2
	make
}

package() {
	cd ${srcdir}/rpm-${pkgver}
	make prefix=${pkgdir}/usr localstatedir=${pkgdir}/var install
	rmdir ${pkgdir}/var/tmp
	install -m755 ${srcdir}/rpmextract.sh ${pkgdir}/usr/bin/
}
