# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-platformtheme
pkgver=1.0.0
pkgrel=1
pkgdesc="Qt platform theme plugin for apps integration with Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-gsettings')
makedepends=('liri-qbs-shared')
groups=('liri')
source=("https://github.com/lirios/platformtheme/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('9fc7cdfff81e32b61bd643d2ee2d440feaf15d156287ee8f90b40c582f57370f')

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
