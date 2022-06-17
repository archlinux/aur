# Maintainer: Mirko Scholz <srtlg>
pkgname=objcryst-fox
pkgver=2022.1
pkgrel=3
pkgdesc='A program for the ab initio structure determination from powder diffraction'
arch=('i686' 'x86_64')
url='http://fox.vincefn.net/FoxWiki'
depends=('glu' 'freeglut' 'wxgtk2' 'fftw')
makedepends=('newmat' 'rsync')
license=('GPL2')
_objcryst_ver=v${pkgver}
_objcryst_dir=objcryst-${_objcryst_ver#v}
_boost_ver=1.68.0
source=(
"Fox.desktop"
"objcryst-${pkgver}.tar.gz::https://github.com/vincefn/objcryst/archive/${_objcryst_ver}.tar.gz"
"https://sourceforge.net/projects/boost/files/boost/1.68.0/boost_1_68_0.tar.bz2"
"http://downloads.sourceforge.net/project/objcryst/3rdPartyLibraries/cctbx.tar.bz2")
noextract=("cctbx.tar.bz2" "boost_${_boost_ver//./_}.tar.bz2")
sha256sums=('d55bafe20672f01a800b8406ad2892f9f34aa545f6b3faa554399198c3dd9492'
            '2a022d16df89ecfef7fac13fa339f788221891a76f037d895f24c16522da336c'
            '7f6130bc3cf65f56a618888ce9d5ea704fa10b462be126ad053e80e553d6d8b7'
            '9cd4c221cfde091a529236c542b5511b1ad8df420dbe2287bd69a492868e3bda')


prepare() {
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
	cd "${srcdir}/${_objcryst_dir}"
	make install -C Fox "DESTDIR=${pkgdir}/usr/bin/Fox"
	install -Dm644 ${srcdir}/Fox.desktop "${pkgdir}/usr/share/applications/Fox.desktop"
	install -Dm644 Fox/src/Fox.xpm "${pkgdir}/usr/share/pixmaps/Fox.xpm"
}
sha256sums=('d55bafe20672f01a800b8406ad2892f9f34aa545f6b3faa554399198c3dd9492'
            '9cf4f214e4baccd52ad62eab368619cb0ae8a4e6d7b17dbdc9ffc71080223f8b'
            '7f6130bc3cf65f56a618888ce9d5ea704fa10b462be126ad053e80e553d6d8b7'
            '9cd4c221cfde091a529236c542b5511b1ad8df420dbe2287bd69a492868e3bda')
