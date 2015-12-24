# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_pkgname=screencloud
pkgname=${_pkgname}-git
pkgver=1.2.0.51.g5855d96
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
	'desktop_entry.patch'
)
sha512sums=(
	'SKIP'
	'0095fe81bd585ff2c683657c87a5c1a5c116a313dd747286d10963b0561b2249d9cf7ee4f4e0d9ab1162d9d2f42d371706ddd6ceccfd935310652daaeaba6fee'
)

pkgver() {
	# Updating package version
	cd ${srcdir}/${_pkgname}
	git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
	# Fix desktop entry
	cd ${srcdir}/${_pkgname}
	patch -p1 < ../desktop_entry.patch
	
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
	
	# Install files
	make DESTDIR=${pkgdir} install
	
	# Create a symbolic link to the Python module
	mkdir -p ${pkgdir}/usr/lib/python3.5/site-packages
	ln -sf /usr/share/screencloud/modules/ScreenCloud.py ${pkgdir}/usr/lib/python3.5/site-packages/ScreenCloud.py
}