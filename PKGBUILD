# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Spike29 <leguen.yannick@gmail.com>
# Contributor: Samir Faci <csgeek@archlinux.us>
# Contributor: TimothÃ©e Ravier <tim@siosm.fr>

pkgbase=qxmpp
pkgname=('qxmpp-qt5' 'qxmpp-doc' 'qxmpp-qt6')
pkgver=1.5.4
pkgrel=1
pkgdesc='Cross-platform C++ XMPP client and server library'
arch=('i686' 'x86_64')
url='https://github.com/qxmpp-project/qxmpp'
license=('LGPL2.1')
depends=('gstreamer' 'glibc' 'gcc-libs' 'glib2')
makedepends=('cmake' 'doxygen')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e437fdb91aa52c6fd8ca3f922354eb3221df98146ec99ee92e70e20a82c7ad2d')

build() {
	cd "$srcdir"
	
	cmake -S $pkgbase-$pkgver -B buildqt5 \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_DOCUMENTATION=1 \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DBUILD_EXAMPLES=0 \
	-DBUILD_TESTS=0 \
	-DWITH_GSTREAMER=1 \
	-DQT_VERSION_MAJOR=5

	cmake --build buildqt5

	cmake -S $pkgbase-$pkgver -B buildqt6 \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_DOCUMENTATION=1 \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DBUILD_EXAMPLES=0 \
	-DBUILD_TESTS=0 \
	-DWITH_GSTREAMER=1 \
	-DQT_VERSION_MAJOR=6

	cmake --build buildqt6
}

package_qxmpp-qt5() {
	provides=("qxmpp")
	#conflicts=("qxmpp-qt6" "qxmpp")
	conflicts=("qxmpp")
	depends+=("qt5-base" "qca-qt5")
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install buildqt5
	rm -rf "$pkgdir/usr/share"
}

package_qxmpp-qt6() {
	provides=("qxmpp-qt6")
	#conflicts=("qxmpp-qt5")
	depends+=("qt6-base")
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install buildqt6
	rm -rf "$pkgdir/usr/share"
	rm -rf "$pkgdir/usr/lib/cmake/QXmpp"
}

package_qxmpp-doc(){
	pkgdesc='Cross-platform C++ XMPP client and server library (documentation)'
	arch=('any')
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install buildqt5
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib"
}
