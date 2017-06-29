# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=pharo
pkgver=6.0.504
pkgrel=1
pkgdesc="a fork of Squeak, an implementation of the object-oriented, dynamically typed, reflective programming language Smalltalk"
arch=(i686 x86_64)
url="http://www.pharo-project.org/"
license=('MIT')
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-alsa-lib' 'lib32-libvorbis' 'lib32-pango' 'lib32-mesa' 'nas' 'lib32-dbus' 'lib32-libxml2')
else
	depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'nas' 'dbus-core' 'libxml2')
fi

_imageversion=${pkgver//./}
_vmversion="20170531"

source=(http://files.pharo.org/vm/pharo-spur64/linux/stable-${_vmversion}.zip \
	http://files.pharo.org/image/60/${_imageversion}-64.zip\
	http://files.pharo.org/media/logo/icon-512x512.png\
	http://files.pharo.org/sources/PharoV60.sources.zip\
	$pkgname.sh
	 $pkgname.desktop)

sha256sums=('8294e58a477704c0f8a237bae04c9c9217c12c7eebf6f412e67143d2687d9006'
            'bbd0cb99b04c36054501c7e6d2be745374e09ba261fc43442a1948f1502f3853'
            '5a6f40722264a2befc9aea1dace399f2491cd45a98987458660f8a39d4e6887e'
            '4a7ca4ecf26fcbff1cc4a38a4457bd405021e0fcc67711c8fb62f99c8e896d75'
            '1cb3cc70da68096fa03e5f261cdfc169b3c97f7d26e17919aed1fef5e07df9fe'
            'ad37a9c7d05b72a1d0375de7b7056dfcb220e2bef6358a99b6075ae6f66905f6')

package() {
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/opt

	umask 002
	cd $srcdir
	mkdir -p $pkgdir/opt/pharo/shared

	cp -R bin $pkgdir/opt/pharo
	cp -R lib $pkgdir/opt/pharo
	install $pkgname.sh $pkgdir/opt/pharo/pharo
	install -m777 Pharo64-${_imageversion}.changes $pkgdir/opt/pharo/shared/Pharo6.0.changes
	install Pharo64-${_imageversion}.image $pkgdir/opt/pharo/shared/Pharo6.0.image
	install PharoV60.sources $pkgdir/opt/pharo/shared/PharoV60.sources
	install -m777 -d $pkgdir/opt/pharo/shared/pharo-local

	ln -s /opt/pharo/pharo $pkgdir/usr/bin/pharo

	install icon-512x512.png $pkgdir/usr/share/pixmaps/$pkgname.png

	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

	chgrp -R users $pkgdir/opt/pharo/
}
