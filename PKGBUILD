# Maintainer: Laurent Laffont <laurent.laffont@gmail.com>
# Maintainer: Benoit Verhaeghe <badetitou@gmail.com>


pkgname=pharo-launcher
epoch=1
pkgver=1.5
pkgrel=1
pkgdesc="Pharo Launcher helps you manage your Pharo images"
arch=(x86_64)
source=($pkgname-$pkgver.tar.gz)
url="http://www.pharo-project.org/"
license=('MIT')
makedepends=('gendesk')

source=(
	'http://files.pharo.org/pharo-launcher/1.5.1/PharoLauncher-linux-1.5.1-x64.zip'
)

md5sums=(
	'c87794d2c8e86823463204cee9752345'
)

prepare() {
	gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --categories "Development"
}


package() {
	cd $srcdir/

	mkdir -p $pkgdir/usr/share/pharo-launcher/
	mkdir -p $pkgdir/usr/share/pharo-vm/
	mkdir -p $pkgdir/usr/share/pixmaps/
	mkdir -p $pkgdir/usr/bin


	cp -fR $srcdir/pharolauncher/shared/* $pkgdir/usr/share/pharo-launcher/
	chgrp -R users $pkgdir/usr/share/pharo-launcher/
	chmod -R 775 $pkgdir/usr/share/pharo-launcher/

	cp -fR $srcdir/pharolauncher/pharo-vm/* $pkgdir/usr/share/pharo-vm/
	chgrp -R users $pkgdir/usr/share/pharo-vm/
	chmod -R 775 $pkgdir/usr/share/pharo-vm/

	sed -i 's/ROOT=`dirname "$DIR"`/ROOT=\/usr\/share/' $srcdir/pharolauncher/pharo-launcher
	sed -i 's/LINUX="$ROOT\/bin"/LINUX="$ROOT\/pharo"/' $srcdir/pharolauncher/pharo-launcher
	sed -i 's/RESOURCES="$ROOT\/shared"/RESOURCES="\/usr\/share\/pharo-launcher\/"/' $srcdir/pharolauncher/pharo-launcher
	sed -i 's/ICONS="$ROOT\/icons"/ICONS="$ROOT\/pixmaps"/' $srcdir/pharolauncher/pharo-launcher

	cp -f $srcdir/pharolauncher/pharo-launcher $pkgdir/usr/bin/pharo-launcher
	chmod +x $pkgdir/usr/bin/pharo-launcher

	cp $srcdir/pharolauncher/icons/pharo-launcher.png	$pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}
