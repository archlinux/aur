# $Id$
# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kuiviewer-git
pkgver=16.12.3.r24.gd10790d
pkgrel=2
pkgdesc='Qt .ui file viewer'
url='https://www.kde.org/applications/development/'
arch=(i686 x86_64)
license=(GPL LGPL FDL)
depends=(qt5-base qt5-tools kcoreaddons kjobwidgets kio ki18n kparts kwidgetsaddons)
makedepends=(cmake)
conflicts=(kdesdk-dev-utils kdesdk-kuiviewer)
provides=(kuiviewer)
source=('git://anongit.kde.org/kde-dev-utils' desktop.patch)
sha256sums=(SKIP 5aa8bde6a16e8f779f54717f63c826ee3f0f2c95b1f39ba6561ec1cca7441f5a)

pkgver() {
	cd "$srcdir/kde-dev-utils"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/kde-dev-utils"
	patch -p1 <../desktop.patch
}

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake ../kde-dev-utils/kuiviewer \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir" install
}
