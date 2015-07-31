# Maintainer: balwierz <user_name at the_most_popular_google_email_service>
pkgbase=cura-bin
pkgname=cura-bin
pkgver=15.06.03
pkgrel=1
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker. This package contains both the binary Cura engine and the python front-end."
depends=('python>=3.4' 'python-pyqt5' 'qt5-quickcontrols' 'python-pyserial' 'wxpython' 'python-numpy' 'python-opengl' 'protobuf3' 'python-protobuf3')
# Depends: python3 (>= 3.4.0),python3-pyqt5 (>= 5.4.0),python3-pyqt5.qtopengl (>= 5.4.0),python3-pyqt5.qtquick (>= 5.4.0),python3-pyqt5.qtsvg (>= 5.4.0),python3-numpy (>= 1.8.0),python3-serial (>= 2.6),qml-module-qtquick2 (>= 5.4.0),qml-module-qtquick-window2 (>= 5.4.0),qml-module-qtquick-layouts (>= 5.4.0),qml-module-qtquick-dialogs (>= 5.4.0),qml-module-qtquick-controls (>= 5.4.0)

#provides=('cura')
replaces=('cura')
conflicts=('libarcus')
url="https://github.com/daid/Cura"
license=('AGPLv3')
arch=('x86_64')
if [ "$CARCH" == x86_64 ]; then
	source+=(http://software.ultimaker.com/15.06/Cura-${pkgver}-Linux.deb)
	sha1sums+=('2e95167de709cc23f6ffb923d2fc1d955c84dd56')
#elif [ "$CARCH" == i686 ]; then
#	source+=(http://software.ultimaker.com/current/cura_${pkgver}-debian_i386.deb)
#	sha1sums+=('e18e5bd4bd72e2af8d97102aea5ecaaf4e93e856')
fi

install=.install

build()
{
	cd "${srcdir}"
	
	# unpack
	if [ -f data.tar.xz ]; then
		tar --xz -xf data.tar.xz
	elif [ -f data.tar.gz ]; then
		tar -xzf data.tar.gz
	fi
}
#apt-get install python3-pyqt5 python3-pyqt5.qtopengl python3-pyqt5.qtquick python3-pyqt5.qtsvg python3-serial qml-module-qtquick2 qml-module-qtquick-window2 qml-module-qtquick-layouts qml-module-qtquick-dialogs libqt5designer5 libqt5help5 libqt5test5 libqt5xml5 libqt5opengl5 libqt5qml5 libqt5quick5 libqt5quickwidgets5 qtdeclarative-abi-5-4-1 qml-module-qtquick-privatewidgets  libqt5clucene5 libqt5sql5 libdouble-conversion1 qml-module-qtquick-controls
package()
{
	# remove the included copy of protobuf:
	rm -rf ${srcdir}/usr/lib/libproto*
	rm -rf ${srcdir}/usr/include/google/
	rm -rf ${srcdir}/usr/bin/protoc
	rm -rf ${srcdir}/usr/lib/liblibprotoc.a
	rm -rf ${srcdir}/usr/lib/python3/dist-packages/google
	
	
	cp -r "${srcdir}"/usr "${pkgdir}"/usr
	
	# fix the location of python modules:
	mkdir ${pkgdir}/usr/lib/python3.4/
	mv ${pkgdir}/usr/lib/python3/dist-packages ${pkgdir}/usr/lib/python3.4/site-packages
	
	
	mv ${pkgdir}/usr/lib64/libArcus.a ${pkgdir}/usr/lib/libArcus.a
	
	# remove cmakes for Arcus:
	rm -rf ${pkgdir}/usr/lib64
}


