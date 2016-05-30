# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=pharo
pkgver=5.0.759
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
vmversion=480

source=(http://files.pharo.org/vm/pharo-spur32/linux/${vmversion}.zip \
	http://files.pharo.org/image/50/${imageversion}.zip\
	http://files.pharo.org/media/logo/icon-512x512.png\
	http://files.pharo.org/sources/PharoV50.sources.zip\
	$pkgname.sh
	 $pkgname.desktop)

sha256sums=('f960f54c3a20fb11bab534da36c8401f6487075ac134d6033e9d3831e79379d6'
            '4f5dbb9a61011ca96d94e5d08c8811512e91e2c0e99fdeb58e9e98bdc3bcc2d4'
            '5a6f40722264a2befc9aea1dace399f2491cd45a98987458660f8a39d4e6887e'
            '2f99195e93e3b70f2915197080d3c69758e6109d1c7cee90c5c57ba2800f747a'
            '3c5ec6c4807df853d3b448d867a1d369a01475015e5dabb4dfdd4a64746c1d87'
            'ad37a9c7d05b72a1d0375de7b7056dfcb220e2bef6358a99b6075ae6f66905f6')

package() {
	cd $srcdir
	unzip $vmversion.zip -d bin

	mkdir -p $pkgdir/opt/pharo/shared
	mkdir -p $pkgdir/usr/bin

	cp -R bin $pkgdir/opt/pharo
	install $pkgname.sh $pkgdir/opt/pharo/pharo
	install Pharo-${imageversion}.changes $pkgdir/opt/pharo/shared/Pharo5.0.changes
	install Pharo-${imageversion}.image $pkgdir/opt/pharo/shared/Pharo5.0.image
	install PharoV50.sources $pkgdir/opt/pharo/shared/PharoV50.sources

	ln -s /opt/pharo/pharo $pkgdir/usr/bin/pharo

	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	install icon-512x512.png $pkgdir/usr/share/pixmaps/$pkgname.png

	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

	chgrp -R users $pkgdir/opt/pharo/
	chmod -R 775 $pkgdir/opt/pharo
}
