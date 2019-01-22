# Maintainer: Mirko Scholz <srtlg>
pkgname=objcryst-fox
pkgver=2017.2.29
pkgrel=2
pkgdesc='A program for the ab initio structure determination from powder diffraction'
arch=('i686' 'x86_64')
url='http://fox.vincefn.net/FoxWiki'
depends=('glu' 'freeglut' 'wxgtk2' 'fftw')
makedepends=('mariadb-libs' 'newmat' 'rsync')
license=('GPL2')
#_objcryst_ver=v${pkgver}
_objcryst_ver=05954fd9c2e0fb80571a3d63fbd7ab8666655ee9
_boost_ver=1.68.0
source=(
"Fox.desktop"
"objcryst-${pkgver}.tar.gz::https://github.com/vincefn/objcryst/archive/${_objcryst_ver}.tar.gz"
"https://dl.bintray.com/boostorg/release/${_boost_ver}/source/boost_${_boost_ver//./_}.tar.bz2"
"http://downloads.sourceforge.net/project/objcryst/3rdPartyLibraries/cctbx.tar.bz2")
noextract=("cctbx.tar.bz2" "boost_${_boost_ver//./_}.tar.bz2")
sha1sums=('6d8bb12fe1add4481ac1733e9cf6aea57aedee61'
          '037a633155160f036997c8b422653e69a87ebaa2'
          '18863a7cae4d58ae85eb63d400f774f60a383411'
          '76f82bae08b2412eb90a05a558dc746274ca8e7b')


prepare() {
	cd "${srcdir}/"
	_objcryst_dir=`tar tf objcryst-${pkgver}.tar.gz | head -1`

	cd "${srcdir}/${_objcryst_dir}"
	[ -e cctbx.tar.bz2 ] || ln -s ../cctbx.tar.bz2
	[ -e boost_${_boost_ver//./_}.tar.bz2 ] || ln -s ../boost_${_boost_ver//./_}.tar.bz2

	cd "${srcdir}/${_objcryst_dir}"
	# http://fox.vincefn.net/Compile/Linux
	cd ObjCryst
	ln -sf rules-gnu.mak rules.mak
	cd ../Fox
	ln -sf gnu.mak Makefile
}

build() {
	cd "${srcdir}/${_objcryst_dir}"
	make shared=1 "RPM_OPT_FLAGS=${CXXFLAGS}" -f gnu.mak -C Fox/src libcctbx libboost
	make shared=1 "RPM_OPT_FLAGS=${CXXFLAGS}" -C Fox
}

package() {
	cd "${srcdir}"
	_objcryst_dir=`tar tf objcryst-${pkgver}.tar.gz | head -1`
	cd "${srcdir}/${_objcryst_dir}"
	make install -C Fox "DESTDIR=${pkgdir}/usr/bin/Fox"
	install -Dm644 ${srcdir}/Fox.desktop "${pkgdir}/usr/share/applications/Fox.desktop"
	install -Dm644 Fox/src/Fox.xpm "${pkgdir}/usr/share/pixmaps/Fox.xpm"
}
