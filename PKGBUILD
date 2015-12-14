# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=screencloud
pkgname=${_pkgname}-git
pkgver=1.2.0.16.g18b2795
pkgrel=2
pkgdesc='An easy to use screenshot sharing tool. Experimental Qt5 UI. Development version.'
arch=('i686' 'x86_64')
url='https://screencloud.net/'
license=('GPL2')

depends=('pythonqt-qt5' 'quazip-qt5' 'qt5-x11extras' 'xdg-utils' 'hicolor-icon-theme')
optdepends=(
	'python-crypto: for SFTP support'
)
makedepends=('cmake' 'git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

install=${pkgname}.install

source=(
	"git+https://github.com/olav-st/${_pkgname}.git#branch=qt5-port"
	'quazip_qt5_fix.patch'
)
sha512sums=(
	'SKIP'
	'e37e6cc4425aef3fc0f4c5dd1580ee1da6ed4b1e1e69eabcd802cc05a4465d984d89894e1b3aa10fab3536007f72dd811e495516620b17dd86900fbf66200787'
)

pkgver() {
	# Updating package version
	cd ${srcdir}/${_pkgname}
	git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
	# QuaZip Qt5 patch
	cd ${srcdir}/${_pkgname}
	patch -p1 < ../quazip_qt5_fix.patch
	
	# Create build directory
	mkdir -p ${srcdir}/build
}

build() {
	# Needed for the self-compiled version
	local _consumer_key='ef5d77317892721a0acebbbc8157272b055da8074'
	local _consumer_secret='2d745141473f640b566aba29147fd672'
	
	# Building package
	cd ${srcdir}/build
	cmake ../${_pkgname}/${_pkgname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5 \
		-DCONSUMER_KEY_SCREENCLOUD=${_consumer_key} \
		-DCONSUMER_SECRET_SCREENCLOUD=${_consumer_secret} \
		-DQT_USE_QT5=ON \
		-DPYTHON_USE_PYTHON3=ON \
		-DPYTHONQT_QTALL_INCLUDE_DIR=/usr/include/PythonQt/extensions/PythonQt_QtAll
}

package() {
	# Installing package
	cd ${srcdir}/build
	
	# Make a copy of the PythonQt lib
	mkdir -p ${srcdir}/build/PythonQt
	cp /usr/lib/libPythonQt.so ${srcdir}/build/PythonQt/
	
	make DESTDIR=${pkgdir} install
}