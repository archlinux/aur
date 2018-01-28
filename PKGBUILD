# Maintainer: Laurent Laffont <laurent.laffont@gmail.com>
# Maintainer: Benoit Verhaeghe <badetitou@gmail.com>


pkgname=pharo-launcher
pkgver=1.1
pkgrel=2
epoch=1
pkgdesc="Pharo Launcher helps you manage your Pharo images"
arch=(x86_64)
source=($pkgname-$pkgver.tar.gz)
url="http://www.pharo-project.org/"
license=('MIT')
makedepends=('gendesk')

source=(
	'http://files.pharo.org/pharo-launcher/1.1/PharoLauncher-linux-1.1-x64.zip'
)

md5sums=(
	'65e32da85f014e2c9682c35ccfa21b0b'
)

prepare() {
	gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}


package() {
	cd $srcdir/

	mkdir -p $pkgdir/usr/share/pharo-launcher/
	mkdir -p $pkgdir/usr/share/pharo/
	mkdir -p $pkgdir/usr/share/pixmaps/
	mkdir -p $pkgdir/usr/bin/

	cp -fR $srcdir/pharo/shared/* $pkgdir/usr/share/pharo-launcher/
	chgrp -R users $pkgdir/usr/share/pharo-launcher/
	chmod -R 775 $pkgdir/usr/share/pharo-launcher/

	cp -fR $srcdir/pharo/bin/* $pkgdir/usr/share/pharo/
	chgrp -R users $pkgdir/usr/share/pharo/
	chmod -R 775 $pkgdir/usr/share/pharo/

	sed -i 's/ROOT=`dirname "$DIR"`/ROOT=\/usr\/share/' $srcdir/pharo/pharo
	sed -i 's/LINUX="$ROOT\/bin"/LINUX="$ROOT\/pharo"/' $srcdir/pharo/pharo
	sed -i 's/RESOURCES="$ROOT\/shared"/RESOURCES="~"/' $srcdir/pharo/pharo
	sed -i 's/ICONS="$ROOT\/icons"/ICONS="$ROOT\/pixmaps"/' $srcdir/pharo/pharo

	cp -f $srcdir/pharo/pharo $pkgdir/usr/bin/pharo
	chmod +x $pkgdir/usr/bin/pharo

	echo "/usr/bin/pharo /usr/share/pharo-launcher/Pharo.image" > $pkgdir/usr/bin/pharo-launcher
	chmod +x $pkgdir/usr/bin/pharo-launcher

	cp $srcdir/pharo/icons/Pharo.png	$pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}
