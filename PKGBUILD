# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qml-xwayland
pkgver=0.10.0
pkgrel=1
pkgdesc="XWayland support for QtQuick Wayland compositors"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-declarative' 'qt5-wayland' 'xorg-server-xwayland')
makedepends=('liri-qbs-shared' 'xcb-util-cursor' 'libxcursor')
options=(debug !strip)
conflicts=('qml-xwayland-git')
groups=('liri')
source=("https://github.com/lirios/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('2e5c5d2fd9ccb2d6cd82f8981e4e43371101c7271f4d6db1865988483e32bbb0')

build() {
	cd ${pkgname}-${pkgver}
	qbs setup-toolchains --type gcc /usr/bin/g++ gcc
	qbs setup-qt /usr/bin/qmake-qt5 qt5
	qbs config profiles.qt5.baseProfile gcc
	qbs build --no-install -d build profile:qt5 \
		modules.lirideployment.prefix:/usr \
		modules.lirideployment.qmlDir:/usr/lib/qt/qml \
		modules.lirideployment.pluginsDir:/usr/lib/qt/plugins
}

package() {
	cd ${pkgname}-${pkgver}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5
}
