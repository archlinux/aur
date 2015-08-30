# Maintainer: Błażej Szczygieł <spaz16 at wp dot pl>

pkgname=kadu-qt4
pkgver=1.5
pkgrel=2
pkgdesc='Qt-based Jabber/XMPP and Gadu-Gadu client'
arch=('i686' 'x86_64')
url='http://www.kadu.im/'
license=('GPL')
depends=('libgadu' 'libxss' 'enchant' 'phonon-qt4' 'qca' 'libidn'
         'libmpdclient' 'libotr' 'libarchive' 'xdg-utils'
         'hicolor-icon-theme' 'qt4')
makedepends=('cmake' 'libao' 'libsndfile' 'libxtst' 'curl' 'chrpath' 'ninja')
install=kadu.install
conflicts=('kadu')
provides=('kadu')
source=(http://download.kadu.im/stable/kadu-$pkgver.tar.bz2 cmake-3.1-fix.patch)
md5sums=('bfc653bc3a5b542877a299209db6adaf' 'dc83b9a9aef5c0a9c6d380c51d866bd3')

prepare() {
	sed -i 's/unity_integration//g' kadu-$pkgver/Plugins.cmake
	sed -i 's/indicator_docking//g' kadu-$pkgver/Plugins.cmake
}

build() {
	cd kadu-$pkgver
	patch -p1 < ../cmake-3.1-fix.patch
	cd ..

	mkdir -p build
	cd build

	cmake ../kadu-$pkgver \
		-GNinja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DQT_QMAKE_EXECUTABLE=qmake-qt4
	ninja
}

package() {
	DESTDIR="$pkgdir" LIBDIR=/usr/lib ninja -C build install
	chrpath -d "$pkgdir"/usr/lib/kadu/plugins/*.so
}
