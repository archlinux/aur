# $Id: PKGBUILD 241398 2015-06-29 17:50:28Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=knode
pkgdesc='News reader for KDE. Standalone version coinstallable with kdepim>=15.08'
pkgver=4.14.10
_kdeappver=15.04.3
pkgrel=3
arch=(i686 x86_64)
url="http://kde.org/applications/internet/knode/"
license=(GPL LGPL FDL)
depends=(kdepimlibs4 grantlee-qt4)
makedepends=(cmake automoc4 boost libxss)
conflicts=('kdepim-libkdepim<5')
source=("http://download.kde.org/Attic/applications/${_kdeappver}/src/kdepim-${pkgver}.tar.xz" trim-baloo.patch)
sha1sums=('6f74763dda68dbb44394e807eab9204777bddf0a'
          '31fc07f9c27874b5c4206f443b9d010ad2b032e3')

prepare() {
   mkdir -p build
   cd kdepim-$pkgver
   patch -p1 -i ../trim-baloo.patch
}

build() {
	cd build
	cmake ../kdepim-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DKDEPIM_BUILD_MOBILE=OFF
	make
}

package() {
	cd "${srcdir}"/build/knode
	make DESTDIR="${pkgdir}" install
	cd "${srcdir}"/build/doc/knode
	make DESTDIR="${pkgdir}" install
	for i in libkdepim messagecomposer messageviewer libkleo libkpgp templateparser agents/sendlateragent \
	  messagecore pimcommon kaddressbookgrantlee incidenceeditor-ng grantleetheme calendarsupport kdgantt2 \
	  libkdepimdbusinterfaces; do
		cd "${srcdir}"/build/${i}
		make DESTDIR="$pkgdir" install
	done

	rm "$pkgdir"/usr/bin/{kincidenceeditor,akonadi*}
	rm "$pkgdir"/usr/lib/*.so
	rm -r "$pkgdir"/usr/share/{akonadi,dbus-1,config.kcfg}
}
