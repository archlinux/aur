# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Elias Riedel Gårding <eliasrg@kth.se>
# Author: Miloš Stojanović <mc.cm.mail@gmail.com>
# Discussion: https://www.reddit.com/r/unixporn/comments/btg6rj/oc_tmatrix_a_new_terminal_digital_rain_simulator

pkgname=tmatrix
pkgver=1.4
pkgrel=1
pkgdesc="cmatrix-like replica of the digital rain from The Matrix"
arch=('x86_64')
url="https://github.com/M4444/TMatrix"
license=('GPL2')
depends=('ncurses')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'CXXFLAGS.patch')
sha256sums=('99591915fa83ceb98c31a97b5686a2df0d667c5d62f3e82837f76e5f9243710e'
            'f2434c711e4f0a4dd68b3f7ae7a50f3ddf1745a3c0ec111a25268af692fb99fe')

prepare() {
	patch -p1 -d "TMatrix-$pkgver" < CXXFLAGS.patch
	cd "TMatrix-$pkgver"
	sed -i \
		-e "s/\${CXXFLAGS}/${CXXFLAGS}/" \
		-e "s/\${LDFLAGS}/${LDFLAGS}/" \
		CMakeLists.txt
}

build() {
	cmake \
		-B build \
		-S "TMatrix-$pkgver" \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir/"
}
