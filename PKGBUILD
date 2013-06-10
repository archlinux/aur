# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Konrad <konrad AT knauber DOT name>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>
# Contributor: Fernando M <f <at> beford.net>
# Author: Wintershade <Wintershade AT google mail DOT com>

pkgname=rpm-org
pkgver=4.11.1_rc1
_pkgver=4.11.1-rc1
pkgrel=1
pkgdesc="RPM Package Manager - RPM.org fork, used in major RPM distros"
arch=('i686' 'x86_64')
url=("http://www.rpm.org/")
license=('GPL2')
depends=('lua' 'file' 'nss>=3.12' 'popt' 'elfutils' 'libarchive')
makedepends=('python2')
conflicts=('rpm' 'rpmextract')
options=('!libtool')
provides=("rpm=${pkgver}" 'rpmextract=1.0-4')
#source=(http://rpm.org/releases/rpm-4.11.x/rpm-${pkgver}.tar.bz2
source=(http://rpm.org/releases/testing/rpm-${_pkgver}.tar.bz2
	rpmextract.sh rpmlib-filesystem-check.patch)
md5sums=('2b41ca2afade8d6cbf0afe7af0dc928e'
         '1f7f4f3b3a93ff6d2f600c7751ae25ef'
         '62a62de128345a8a7a6195fd59f8cd71')

prepare() {
	cd ${srcdir}/rpm-${_pkgver}
	patch -p1 < ../rpmlib-filesystem-check.patch
}


build() {
	cd ${srcdir}/rpm-${_pkgver}

	./configure \
		--prefix=/usr  \
		--sysconfdir=/etc  \
		--localstatedir=/var \
		--enable-python \
		--with-external-db \
		--with-lua \
		--with-cap \
		CPPFLAGS="`pkg-config --cflags nss`" \
		PYTHON=python2
	make
}

package() {
	cd ${srcdir}/rpm-${_pkgver}
	make prefix=${pkgdir}/usr localstatedir=${pkgdir}/var install
	rmdir ${pkgdir}/var/tmp
	rmdir ${pkgdir}/var
	# rpmextract using bsdtar, needs libarchive
	install -m755 ${srcdir}/rpmextract.sh ${pkgdir}/usr/bin/

	# move rpm from /bin to /usr/bin
	mv ${pkgdir}/bin/rpm ${pkgdir}/usr/bin/
	rm ${pkgdir}/usr/bin/rpm{query,verify}
	cd ${pkgdir}/usr/bin
	ln -s rpm rpmquery
	ln -s rpm rpmverify
	rm -r ${pkgdir}/bin/
}
