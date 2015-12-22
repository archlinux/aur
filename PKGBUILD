# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=screencloud
pkgname=${_pkgname}-git
pkgver=1.2.0.49.g5975819
pkgrel=2
pkgdesc='An easy to use screenshot sharing tool. Experimental Qt5 UI. Development version.'
arch=('i686' 'x86_64')
url='https://screencloud.net/'
license=('GPL2')

depends=('qt5-x11extras' 'qt5-svg' 'qt5-multimedia' 'pythonqt-qt5' 'quazip-qt5' 'xdg-utils' 'hicolor-icon-theme')
optdepends=(
	'python-crypto: for SFTP support'
)
makedepends=('cmake' 'git' 'qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

install=${pkgname}.install

source=(
	"git+https://github.com/olav-st/${_pkgname}.git"
	'cmake_fix.patch'
)
sha512sums=(
	'SKIP'
	'713f3563abb5f3e6b25fb2e00d23ff6428e479a09374a17531f5c9e185bbe2ad4a0fe3225b7375be9fdf4be5e15549ab5f030efdf8bbf093e5fe528258bd4da1'
)

pkgver() {
	# Updating package version
	cd ${srcdir}/${_pkgname}
	git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
	# Fix installation issues
	cd ${srcdir}/${_pkgname}
	patch -p1 < ../cmake_fix.patch
	
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
		-DPYTHON_USE_PYTHON3=ON
}

package() {
	# Installing package
	cd ${srcdir}/build
	
	mkdir -p ${srcdir}/build/PythonQt
	cp /usr/lib/libPythonQt.so ${srcdir}/build/PythonQt/libPythonQt.so
	
	# Install files
	make DESTDIR=${pkgdir} install
}