# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Konrad <konrad AT knauber DOT name>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>
# Contributor: Fernando M <f <at> beford.net>
# Author: Wintershade <Wintershade AT google mail DOT com>

pkgname=rpm-org
pkgver=4.11.0.1
pkgrel=1
pkgdesc="RPM Package Manager - RPM.org fork, used in major RPM distros"
arch=('i686' 'x86_64')
url=("http://www.rpm.org/")
license=('GPL2')
depends=('lua' 'file' 'nss>=3.12' 'popt' 'elfutils' 'db' 'libarchive')
makedepends=('python2')
conflicts=('rpm' 'rpmextract')
options=('!libtool')
provides=("rpm=${pkgver}" 'rpmextract=1.0-4')
source=(http://rpm.org/releases/rpm-4.11.x/rpm-${pkgver}.tar.bz2
	rpmextract.sh finish-lua52-support.patch)
md5sums=('b35f5359e0d4494d7b11e8d0c1512a0d'
         '1f7f4f3b3a93ff6d2f600c7751ae25ef'
         'a82a9372f2bca43049791c162a36c1e5')


build() {
	cd ${srcdir}/rpm-${pkgver}

	patch -p1 < ../finish-lua52-support.patch

	./configure \
		--prefix=/usr  \
		--sysconfdir=/etc  \
		--localstatedir=/var \
		--enable-python \
		--with-external-db \
		--with-lua \
		CPPFLAGS="`pkg-config --cflags nss`" \
		PYTHON=python2
	make
}

package() {
	cd ${srcdir}/rpm-${pkgver}
	make prefix=${pkgdir}/usr localstatedir=${pkgdir}/var install
	rmdir ${pkgdir}/var/tmp
	# rpmextract using bsdtar, needs libarchive
	install -m755 ${srcdir}/rpmextract.sh ${pkgdir}/usr/bin/
}
