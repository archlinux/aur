# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=yubikey-manager-qt
pkgver=1.0.1
pkgrel=1
pkgdesc='Cross-platform application for configuring any YubiKey over all USB transports'
arch=('x86_64')
url='https://developers.yubico.com/yubikey-manager-qt/'
license=('BSD')
depends=('yubikey-manager' 'python' 'qt5-base' 'qt5-quickcontrols2' 'python-pyotherside')
makedepends=('git') 
replaces=('yubikey-neo-manager')
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3') # Dag Heyman <dag@yubico.com>
#source=("https://developers.yubico.com/${pkgname}/Releases/${pkgname}-${pkgver}.tar.gz"{,.sig})
#sha256sums=('cfee0e262641bac1b6928be8ba2fb02ac15b6c1ea551bebf5b598b6716741b86'
#            'SKIP')
source=("git+https://github.com/Yubico/yubikey-manager-qt.git#tag=${pkgname}-${pkgver}?signed"
	'git+https://github.com/thp/pyotherside.git'
	'git+https://github.com/Yubico/yubikey-manager.git'
	'git+https://github.com/qtproject/qt-solutions')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd yubikey-manager-qt/

	git config --file=.gitmodules submodule.vendor/pyotherside.url ../pyotherside/
	git config --file=.gitmodules submodule.vendor/yubikey-manager.url ../yubikey-manager/
	git config --file=.gitmodules submodule.ykman-gui/vendor/qt-solutions.url ../qt-solutions/

	git submodule init
	git submodule update
}


build() {
	cd yubikey-manager-qt/

	qmake-qt5
	make
}

package() {
	cd yubikey-manager-qt/

	make INSTALL_ROOT="${pkgdir}/" install

	install -D -m0644 resources/ykman-gui.desktop "${pkgdir}/usr/share/applications/ykman-gui.desktop"
	install -D -m0644 resources/icons/ykman.png "${pkgdir}/usr/share/pixmaps/ykman.png"

	install -D -m0644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}

