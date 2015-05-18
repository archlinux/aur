# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Konrad <konrad AT knauber DOT name>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>
# Contributor: Fernando M <f <at> beford.net>
# Author: Wintershade <Wintershade AT google mail DOT com>

pkgname=rpm-org
pkgver=4.12.0.1
_pkgver=$pkgver
#_pkgver=4.12.0-rc1
pkgrel=3
pkgdesc="RPM Package Manager - RPM.org fork, used in major RPM distros"
arch=('i686' 'x86_64')
url=("http://www.rpm.org/")
license=('GPL2')
depends=('lua>=5.1' 'file' 'nss>=3.12' 'popt' 'elfutils' 'libarchive' 'libcap')
makedepends=('python2' 'python')
optdepends=('libdbus: systemd inhibit plugin')
conflicts=('rpm' 'rpmextract')
options=('!libtool')
provides=("rpm=${pkgver}" 'rpmextract=1.0-4')
#source=(http://rpm.org/releases/testing/rpm-${_pkgver}.tar.bz2
source=(http://rpm.org/releases/rpm-4.12.x/rpm-${pkgver}.tar.bz2
	rpmextract.sh rpmlib-filesystem-check.patch lua-5.3.patch)
sha1sums=('d416bdb249b246b00b2d5d34c66e7f5a68a62524'
          '74849919207885ae024f1ab8ed68a76474d67ad7'
          '0c5fa516dde1f10211af896c729e4b00c313e12b'
          'e8efa065eb42648ac431a48b083888ae77e8ae4b')

prepare() {
	cd ${srcdir}/rpm-${_pkgver}
	patch -p1 < ../rpmlib-filesystem-check.patch
	patch -p1 < ../lua-5.3.patch
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

	# also install python 3 files
	# building with python 3 files as default doesn't seem to work
	cd ${srcdir}/rpm-${_pkgver}
	cd python
	python setup.py install --root="$pkgdir/" --optimize=1
}
