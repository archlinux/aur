# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=pharo
pkgver=6.0.543
pkgrel=1
pkgdesc="a fork of Squeak, an implementation of the object-oriented, dynamically typed, reflective programming language Smalltalk"
arch=(x86_64)
url="http://www.pharo-project.org/"
license=('MIT')
depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'nas' 'dbus' 'libxml2')

_imageversion=${pkgver//./}
_vmversion="201808291622-d952580"

source=(http://files.pharo.org/vm/pharo-spur64/linux/pharo-linux-x86_64threaded-${_vmversion}.zip \
	http://files.pharo.org/image/60/${_imageversion}-64.zip\
	http://files.pharo.org/media/logo/icon-512x512.png\
	http://files.pharo.org/sources/PharoV60.sources.zip\
	$pkgname.sh
	 $pkgname.desktop)

sha256sums=('9212189b822325f801699a878e68c1363dce5e3c6a4f6f251d1fb62429cf289a'
            '6971b268205a168231c5626bbfc8656ba8577ed06821646963fc600497f076a6'
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
