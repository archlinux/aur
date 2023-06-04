# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=netpad-player
pkgver=1.5.1
pkgrel=1
epoch=
pkgdesc="网络画板，用核心技术赋能智慧数学教育"
arch=(x86_64 aarch64)
url="https://www.netpad.net.cn/"
license=('custom')
groups=()
depends=(electron bash)
makedepends=(asar gendesk)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.netpad.net.cn/download/NetpadPlayer-1.5.1.exe")
noextract=()
sha256sums=('db37a6bb0659602ba130243b9e1d51f27a35b517aa227e0a21105de0bce02ad5')
validpgpkeys=()

prepare(){
    find $srcdir -name app.asar -exec asar e {} ./app \;
	rm -vrf app/compile
}

package() {
	install -d $pkgdir/opt/$pkgname/
	cp -av app $pkgdir/opt/$pkgname/
	install -Dm755 /dev/null $pkgdir/usr/bin/netpad-player
	echo "#!/bin/sh" > $pkgdir/usr/bin/netpad-player
	echo "electron /opt/$pkgname/app" >> $pkgdir/usr/bin/netpad-player

	find $srcdir -name icon.png -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/$pkgname.png \;

	gendesk --name 网络画板离线播放器 --exec /usr/bin/netpad-player --pkgname $pkgname --icon $pkgname
	install -Dm644 $pkgname.desktop -t $pkgdir/usr/share/applications/
}
