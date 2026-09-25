# Maintainer: gfrank227 [at] gmail [dot] com
pkgname=nordvpn-gui
pkgver=5.4.0
pkgrel=5
arch=('x86_64')
pkgdesc='GUI for NordVPN'
url='https://nordvpn.com'
license=('GPL-3.0-only')
depends=('nordvpn-bin' 'gtk3' 'hicolor-icon-theme')
makedepends=('fvm' 'cmake' 'ninja' 'clang')
options=('!debug')
source=("${pkgname}-${pkgver}::https://github.com/NordSecurity/nordvpn-linux/archive/refs/tags/${pkgver}.tar.gz"
		"nordvpn-gui.desktop")
sha256sums=('3d66bb329ff34a5a9fe1e1a642792bb637717393167ee55996da2786b8eab7f9'
            'a9db53b6c1b5894bf8acf1dac3b63031377fcad3f9695ad190cce8e7d3032705')
fvmversion=3.44.9
build() {
	cd $srcdir/nordvpn-linux-${pkgver}/gui
	fvm use $fvmversion
	sed -i s/"version: 0.0.1"/"version: ${pkgver}"/ $srcdir/nordvpn-linux-${pkgver}/gui/pubspec.yaml
	$srcdir/nordvpn-linux-${pkgver}/gui/.fvm/versions/$fvmversion/bin/flutter build linux
}
package() {
	install -dm755 $pkgdir/opt/nordvpn-gui
	cp -rf $srcdir/nordvpn-linux-${pkgver}/gui/build/linux/x64/release/bundle/* $pkgdir/opt/nordvpn-gui
	install -Dm644 $srcdir/nordvpn-linux-${pkgver}/gui/web/icons/icon-512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/nordvpn-gui.png
	install -Dm644 $srcdir/nordvpn-linux-${pkgver}/gui/web/icons/icon.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/nordvpn-gui.svg
	install -Dm755 $srcdir/nordvpn-gui.desktop -t $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/bin
	ln -s /opt/nordvpn-gui/nordvpn-gui $pkgdir/usr/bin/nordvpn-gui
}
