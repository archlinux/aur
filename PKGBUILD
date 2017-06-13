# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=pharo64
pkgver=6.0.499
pkgrel=1
pkgdesc="An implementation of the object-oriented, dynamically typed, reflective
programming language Smalltalk."
arch=(x86_64)
url="http://www.pharo-project.org/"
license=('MIT')
depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'nas' 'dbus' 'libxml2')

_imageversion=${pkgver//./}
_vmversion="stable-20170531"

source=(http://files.pharo.org/vm/pharo-spur64/linux/${_vmversion}.zip \
	http://files.pharo.org/image/60/${_imageversion}-64.zip\
	http://files.pharo.org/media/logo/icon-512x512.png\
	http://files.pharo.org/sources/PharoV60.sources.zip\
	$pkgname.sh
	 $pkgname.desktop)

sha256sums=('8294e58a477704c0f8a237bae04c9c9217c12c7eebf6f412e67143d2687d9006'
            '05a22fb6450794f96b12dbf5a859fa2cc34404e648286f8e6207707aa0e3edd6'
            '5a6f40722264a2befc9aea1dace399f2491cd45a98987458660f8a39d4e6887e'
            '4a7ca4ecf26fcbff1cc4a38a4457bd405021e0fcc67711c8fb62f99c8e896d75'
            '1cb3cc70da68096fa03e5f261cdfc169b3c97f7d26e17919aed1fef5e07df9fe'
            'cf2c08bb2e48a551af0a5142609b42c789ee8398b005b5ee4caadd6ae6d7b1dd')

package() {
	cd $srcdir
	unzip -o ${_vmversion}.zip -d bin

	mkdir -p $pkgdir/opt/pharo64/shared
	mkdir -p $pkgdir/usr/bin

	cp -R bin $pkgdir/opt/pharo64
	install $pkgname.sh $pkgdir/opt/pharo64/pharo
	install Pharo64-${_imageversion}.changes $pkgdir/opt/pharo64/shared/Pharo6.0.changes
	install Pharo64-${_imageversion}.image $pkgdir/opt/pharo64/shared/Pharo6.0.image
	install PharoV60.sources $pkgdir/opt/pharo64/shared/PharoV60.sources

	ln -s /opt/pharo64/pharo $pkgdir/usr/bin/pharo64

	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	install icon-512x512.png $pkgdir/usr/share/pixmaps/$pkgname.png

	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

	chgrp -R users $pkgdir/opt/pharo64/
	chmod -R 775 $pkgdir/opt/pharo64
}
