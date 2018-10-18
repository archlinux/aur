# Maintainer: Mirko Scholz <srtlg>
pkgname=objcryst-fox
pkgver=2017.2
pkgrel=1
pkgdesc='A program for the ab initio structure determination from powder diffraction'
arch=('i686' 'x86_64')
url='http://fox.vincefn.net/FoxWiki'
depends=('glu' 'freeglut' 'wxgtk2' 'fftw')
makedepends=('libmariadbclient' 'newmat')
license=('GPL2')
source=(
"Fox.desktop"
"boost_C++0x.patch"
"FoxServerThread.patch"
"https://github.com/vincefn/objcryst/archive/v${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/objcryst/3rdPartyLibraries/cctbx.tar.bz2")
noextract=("cctbx.tar.bz2")
sha1sums=('6d8bb12fe1add4481ac1733e9cf6aea57aedee61'
          'bb4543680a8fb9a7752811ffe12df15f0704903b'
          '8347e418458816e7b5875433690ed58dd198d6b7'
          '767480573e16cc75d0f81db29e6acc380fe81643'
          '1aa2d033d45a86e928ee58196fe5916da9376c18')

prepare() {
	cd "${srcdir}/objcryst-${pkgver}"
	# from Debian package
	sed -i -e 's?install -m 755 src/Fox /usr/local/bin?install -Dm 755 src/Fox $(DESTDIR)/usr/bin/Fox?' Fox/gnu.mak
	cd "${srcdir}/objcryst-${pkgver}"

	cd "${srcdir}/objcryst-${pkgver}"
	# http://fox.vincefn.net/Compile/Linux
	cd ObjCryst
	ln -sf rules-gnu.mak rules.mak
	cd ../Fox
	ln -sf gnu.mak Makefile

	cd "${srcdir}/objcryst-${pkgver}"
	# patch the faulty boost
	# prevent it from beeing overwritten
	sed -i -e 's/cd $(BUILD_DIR) && tar -xjf cctbx.tar.bz2/#/g' ObjCryst/rules-gnu.mak
	# https://stackoverflow.com/questions/18900730/boostshared-ptrshared-ptrconst-boostshared-ptr-is-implicitly-declared
	if [ ! -e cctbx.tar.bz2 ]; then
		ln -s ../cctbx.tar.bz2
		tar -xjf cctbx.tar.bz2
		fgrep 'BOOST_LIB_VERSION "1_47"' cctbx/include/boost/version.hpp || exit 1
		cd cctbx/include
		patch -p2 < "${srcdir}/boost_C++0x.patch"

		cd "${srcdir}/objcryst-${pkgver}"
		patch -p1 < "${srcdir}/FoxServerThread.patch"
	# else assume already patched
	fi
}

build() {
	cd "${srcdir}/objcryst-${pkgver}"
	make shared=1 "RPM_OPT_FLAGS=${CXXFLAGS}" -C Fox
}

package() {
	cd "${srcdir}/objcryst-${pkgver}"
	make install -C Fox "DESTDIR=${pkgdir}"
	install -Dm644 ${srcdir}/Fox.desktop "${pkgdir}/usr/share/applications/Fox.desktop"
	install -Dm644 Fox/src/Fox.xpm "${pkgdir}/usr/share/pixmaps/Fox.xpm"
}
