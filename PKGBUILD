# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=pharo
pkgver=4.0.615
pkgrel=1
pkgdesc="a fork of Squeak, an implementation of the object-oriented, dynamically typed, reflective programming language Smalltalk"
arch=(i686 x86_64)
url="http://www.pharo-project.org/"
license=('MIT')
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-alsa-lib' 'lib32-libvorbis' 'lib32-pango' 'lib32-mesa' 'nas' 'lib32-dbus-core' 'lib32-libxml2')
else
	depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'nas' 'dbus-core' 'libxml2')
fi

imageversion=${pkgver//./}

source=(http://files.pharo.org/vm/pharo/linux/stable.zip \
	http://files.pharo.org/image/40/${imageversion}.zip\
	http://files.pharo.org/media/logo/icon-512x512.png\
	$pkgname.sh
	 $pkgname.desktop)

md5sums=('5031fa155741e745e629070134f08b9a'\
	'4ae3df0ac2c3f84346e7976b2fa8264b'\
	'6424f4db069bf43aefd3f3fae673e4a6'\
	'24050a25113d7b5d28557d2a99b1ad19'\
	'1447999d37a6d87ddddc2f99d9781bbc')

package() {
	cd $srcdir
	unzip stable.zip -d bin

	mkdir -p $pkgdir/opt/pharo/shared
	mkdir -p $pkgdir/usr/bin

	cp -R bin $pkgdir/opt/pharo
	install $pkgname.sh $pkgdir/opt/pharo/pharo
	install Pharo-${imageversion}.changes $pkgdir/opt/pharo/shared/Pharo4.0.changes
	install Pharo-${imageversion}.image $pkgdir/opt/pharo/shared/Pharo4.0.image

	chgrp -R users $pkgdir/opt/pharo/
	chmod -R 755 $pkgdir/opt/pharo

	ln -s /opt/pharo/pharo $pkgdir/usr/bin/pharo

	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	install icon-512x512.png $pkgdir/usr/share/pixmaps/$pkgname.png

	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
