# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-qbs-shared
pkgver=0.9.0
pkgrel=1
pkgdesc="Extra imports and modules for Qbs"
arch=('any')
url='https://liri.io'
license=('BSD')
depends=('qbs')
groups=('liri')
source=("https://github.com/lirios/qbs-shared/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('e171d86b485e5f6c5f1f5bdcd3bfad1b86df244bae92e015fcc74d22068aa48b')

build() {
	cd ${pkgname}-${pkgver}
	qbs setup-toolchains --type gcc /usr/bin/g++ gcc
	qbs setup-qt /usr/bin/qmake-qt5 qt5
	qbs config profiles.qt5.baseProfile gcc
	qbs build --no-install -d build profile:qt5 qbs.installRoot:/ qbs.installPrefix:usr
}

package() {
	cd ${pkgname}-${pkgver}
	qbs install -d build --no-build -v --install-root $pkgdir profile:qt5

	mkdir -p $pkgdir/usr/share/licenses/liri-qbs-shared
	cp LICENSE.BSD $pkgdir/usr/share/licenses/liri-qbs-shared

	find $pkgdir -type f -name "*.py" | xargs rm -f
}
