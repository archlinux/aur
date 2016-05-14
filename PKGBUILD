# Contributor: Laurent Laffont <laurent.laffont@gmail.com>


pkgname=pharo-launcher
pkgver=5.0
pkgrel=0
pkgdesc="Pharo Launcher helps you manage your Pharo images"
arch=(i686 x86_64)
source=($pkgname-$pkgver.tar.gz)
url="http://www.pharo-project.org/"
license=('MIT')
makedepends=('gendesk')
depends=('pharo-vm' 'pharo-spur-vm')

source=(
	'http://files.pharo.org/media/logo/icon-lighthouse-128x128.png'
	'http://files.pharo.org/platform/launcher/PharoLauncher-user-stable-2016.03.14.zip'
)

md5sums=(
	'dec67d08d24433696375a319de029f34'
	'4e6290f0d7561afff2a386ab2802dde6'
)

prepare() {
	gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}


package() {
	cd $srcdir/

	pharo -vm-display-X11 -headless PharoLauncher.image eval "PhLLaunchImageCommand spurFullPath: '/usr/bin/pharo-spur'. Smalltalk snapshot: true andQuit: true"

	mkdir -p $pkgdir/usr/share/pharo-launcher/
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/pixmaps/

	cp -f $srcdir/PharoLauncher.* $pkgdir/usr/share/pharo-launcher/
	chgrp users $pkgdir/usr/share/pharo-launcher/PharoLauncher.changes
	chmod 775 $pkgdir/usr/share/pharo-launcher/PharoLauncher.changes

	echo "/usr/bin/pharo /usr/share/pharo-launcher/PharoLauncher.image" > $pkgdir/usr/bin/pharo-launcher
	chmod +x $pkgdir/usr/bin/pharo-launcher

	cp $srcdir/icon-lighthouse-128x128.png	$pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
