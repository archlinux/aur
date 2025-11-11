# Maintainer: gfrank227 [at] gmail [dot] com
pkgname=nordvpn-gui
pkgver=4.2.2
pkgrel=2
arch=('x86_64')
pkgdesc='GUI for NordVPN'
url='https://nordvpn.com'
license=('GPL-3.0-only')
depends=('nordvpn-bin' 'gtk3' 'hicolor-icon-theme')
makedepends=('flutter-bin')
options=('!debug')
install=daemon_restart.install
source=("https://github.com/NordSecurity/nordvpn-linux/archive/refs/tags/${pkgver}.tar.gz"
		"nordvpn-gui.desktop"
		"daemon_restart.install")
sha256sums=('b2762a464bc281e1af675f534f70f7c5fd99d1b921f9912eb0d5f18822de4ff0'
            'bce0edf1b5130899b7621f0de8355f0c6fa07374957ef893a5f5065fd9c98952'
            'b3bc3b4519769cc9c78258b16eb44765ddd8168951997d8bafdc7b8fcb73d868')

prepare() {
		tar -xvzf ${pkgver}.tar.gz
}
build() {
	cd $srcdir/nordvpn-linux-${pkgver}/gui
	sed -i s/0.0.1/${pkgver}/ $srcdir/nordvpn-linux-${pkgver}/gui/pubspec.yaml
	flutter build linux
}
package() {
	install -dm755 $pkgdir/opt/nordvpn-gui
	cp -rf $srcdir/nordvpn-linux-${pkgver}/gui/build/linux/x64/release/bundle/* $pkgdir/opt/nordvpn-gui
	install -dm644 $pkgdir/usr/share/icons/hicolor/scalable/apps
	install -dm744 $pkgdir/usr/share/applications
	install -Dm644 $srcdir/nordvpn-linux-${pkgver}/gui/web/icons/icon-512.png $pkgdir/usr/share/icons/hicolor/scalable/apps/nordvpn-gui.png
	install -Dm744 $srcdir/nordvpn-gui.desktop -t $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/bin
	ln -s /opt/nordvpn-gui/nordvpn-gui $pkgdir/usr/bin/nordvpn-gui
}
