# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>

_gitname=pulseview
pkgname="$_gitname-qt6-git"
pkgver=0.3.0.r1173.gaf02198
pkgrel=1
pkgdesc='A Qt based logic analyzer, oscilloscope and MSO GUI for sigrok. (git version built with Qt6)'
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url=https://sigrok.org/wiki/PulseView
license=(GPL-3.0-or-later)
depends=(boost-libs libsigrok-git libsigrokdecode-git qt6-base qt6-svg hicolor-icon-theme)
makedepends=(git cmake boost qt6-tools)
provides=("$_gitname")
conflicts=("$_gitname" "$_gitname-git")
source=("git://sigrok.org/$_gitname.git")
#source=("git+https://github.com/sigrokproject/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long --abbrev=7 --exclude=pulseview-unreleased | sed 's/^pulseview-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_gitname"
	sed -i 's/^find_package(Qt5/#&/' CMakeLists.txt
}

build() {
	cmake -B build -S "$_gitname" \
		-Wno-dev \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
