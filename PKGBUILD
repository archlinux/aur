# $Id: PKGBUILD 151884 2015-12-10 04:07:37Z foutrelis $
# Maintainer: Peter Vágner <pvdeejay@gmail.com>
# (added from qt-at-spi package)
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor: Kyle <kyle@gmx.ca>

_pkgname=qt-at-spi
pkgname=lib32-$_pkgname-git
pkgver=0.4.0.r2.g15ab906
pkgrel=1
pkgdesc="A Qt plugin that bridges the QAccessible API’s to the AT-SPI 2 protocol, giving blind and visually impaired users access to qt applications."
arch=(x86_64)
url="http://projects.kde.org/qtatspi"
license=('LGPL')
depends=('lib32-at-spi2-core' 'lib32-qt4>=4.8' 'qt-at-spi')
makedepends=('gcc-multilib' 'git' 'qt4')
provides=('lib32-qt-at-spi')
conflicts=('lib32-qt-at-spi')
options=('!libtool')
source=("git://anongit.kde.org/qtatspi.git")
md5sums=('SKIP')

pkgver() {
	cd qtatspi
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd qtatspi

	# This is extremelly hacky!
	# Remove translation support as this is unused.
	# What in turn removes dependency on kdelibs
	# Hard dependency on 32 bit kdelibs would mean we need to pull loads of dependencies
	# for unused feature I'm rather adding hacks like this instead.
	git revert --no-commit ba3501dd3f23d5198dc5a2feef0971a68d3b26fd baaff9ba9158fd8fd33460698d73dd2c12055524 bd1221af25152ff3ba597daab73218a81e2700f3 
	git rm -f CMakeLists.txt src/CMakeLists.txt
	git revert --no-commit 07d245364cb4accc93ff1e3bdaeb559fedf1f1dc

	sed -ri "s:(target\.path = ).*:\1/usr/lib32/qt/plugins/accessiblebridge:g" src/src.pro
	sed -i 's/QMAKE_CXXFLAGS.*$/&\nQMAKE_INCDIR_QT=\/usr\/include\/qt4-32/' src/src.pro
}

build() {
	cd qtatspi/src
	qmake-qt4 -query
	qmake-qt4 -r -spec linux-g++-32
	make
}

check() {
	cd qtatspi/src
	make -k check
}

package() {
	cd qtatspi/src
	make INSTALL_ROOT="$pkgdir" install

	# Try to tidy up that mess we have introduced in prepare
	# To make the life a bit easier if the build is started multiple times.
	git reset --hard
}
