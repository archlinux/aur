
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theshell-blueprint
pkgver=6.2b
pkgrel=0
pkgdesc="Desktop Shell that gets out of your way"
arch=("x86_64")
url="https://github.com/vicr123/theshell"
license=('GPL3')
depends=('kwidgetsaddons' 'xdg-utils' 'wmctrl' 'kwin' 
'networkmanager' 'xorg-xbacklight' 'redshift' 'tsscreenlock' 
'libcups' 'qt5-base' 'ts-qtplatform' 'ts-startsession'
'qt5-location' 'kscreen' 'kdepimlibs4' 'akonadi' 'ts-polkitagent' 'ts-bt' 'ts-bugreport')
optdepends=('alsa-utils: for volume controls'
	    'pocketsphinx: for theWave'
	    'festival: for theWave')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theshell#branch=blueprint'
	"theshellb.desktop")
md5sums=('SKIP' 'SKIP')

build() {
	cd "$pkgname-$pkgver"
	git checkout blueprint
	qdbuscpp2xml -M -s notificationdbus.h -o org.freedesktop.Notifications.xml
	qdbuscpp2xml -a -o org.thesuite.power.xml upowerdbus.h
	qdbuscpp2xml -a -o org.thesuite.theshell.xml dbussignals.h
	qmake theShell.pro
	make
}

package() {
	chmod +x "initscript.sh"
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/theshell" "$pkgdir/usr/bin/theshellb"
	mkdir -p "$pkgdir/usr/share/xsessions"
	cp "theshellb.desktop" "$pkgdir/usr/share/xsessions"
}
