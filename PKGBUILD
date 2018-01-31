# Maintainer: fenugrec

# This build is hacked up to not require KDE; WIP.
# Not sure if there ever was a functional QT-only GUI. This at least builds 
# some CLI tools, mainly piklab-prog .
# - some subsystems are disabled even though they don't directly depend on KDE
# - needs qt4
# - -Wno-deprecated-declarations because of "auto_ptr" usage
# - LOCALE_INSTALL_DIR manually set (cmake KDEinstalldirs module did this)
# - piklab-prog has some issues due to the "nokde" stubs
# - some of the patch chunks in noqt_all.patch were not necessary after all

pkgname=piklab-qt-svn
_pkgname=piklab
pkgver=r2982
pkgrel=1
pkgdesc="IDE for Microchip PIC and dsPIC microcontrollers similar to the MPLAB environment"
url="http://piklab.sourceforge.net"
license=('GPL')
arch=('i686' 'x86_64')

depends=('libusb-compat' 'qt4')
makedepends=('subversion' 'cmake' 'automoc4')
optdepends=('pk2cmd-plus: PICkit 2 CLI software with updated DeviceFile and udev rules'
		'pikloops: Utility to compute timing loops'
		'gputils: PIC programming utilities'
		'sdcc: C compiler')
provides=("${_pkgname}")

install=$_pkgname.install
source=("$_pkgname::svn+https://svn.code.sf.net/p/piklab/code/trunk/")
sha256sums=('SKIP')

prepare() {
	cd $_pkgname
	svn patch ../../noqt_all.patch
}

build() {
	cd $_pkgname/piklab_kde4
	cmake -D 'QT_ONLY=1' -D 'CMAKE_INSTALL_PREFIX=/usr' \
		-D 'CMAKE_CXX_FLAGS=-Wno-narrowing -Wno-deprecated-declarations' \
		-D 'LOCALE_INSTALL_DIR=/usr/share/locale' .
	make
}

package() {
	cd $_pkgname/piklab_kde4
	mkdir -p ${pkgdir}/usr
	make DESTDIR="${pkgdir}" -j1 install
	mv -v ${pkgdir}/lib ${pkgdir}/usr
}


pkgver() {
	cd $_pkgname/piklab_kde4
	local _ver="$(svnversion)"
	printf "r%s" "${_ver//[[:alpha:]]}"
}
