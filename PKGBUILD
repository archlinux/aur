# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=pharo
pkgver=5.0.359
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
	http://files.pharo.org/image/50/${imageversion}.zip\
	http://files.pharo.org/media/logo/icon-512x512.png\
	http://files.pharo.org/sources/PharoV40.sources.zip\
	$pkgname.sh
	 $pkgname.desktop)

sha256sums=('e525ded202ac0e9f7a2db38fbe32ac07bca2d2e6ef90b17fd08f438d40a4f1f9'\
	'059ceb724adde7e8a73eca5c061d7b640cf236f7595e9a4de2741175a12e76c5'\
	'5a6f40722264a2befc9aea1dace399f2491cd45a98987458660f8a39d4e6887e'\
	'ed5a2c1b729c5cd5825841a4691affe81d2c121467e488f2bb30058a833801f7'\
	'3c5ec6c4807df853d3b448d867a1d369a01475015e5dabb4dfdd4a64746c1d87'\
	'ad37a9c7d05b72a1d0375de7b7056dfcb220e2bef6358a99b6075ae6f66905f6')

package() {
	cd $srcdir
	unzip stable.zip -d bin

	mkdir -p $pkgdir/opt/pharo/shared
	mkdir -p $pkgdir/usr/bin

	cp -R bin $pkgdir/opt/pharo
	install $pkgname.sh $pkgdir/opt/pharo/pharo
	install Pharo-${imageversion}.changes $pkgdir/opt/pharo/shared/Pharo5.0.changes
	install Pharo-${imageversion}.image $pkgdir/opt/pharo/shared/Pharo5.0.image
	install PharoV40.sources $pkgdir/opt/pharo/shared/PharoV40.sources

	ln -s /opt/pharo/pharo $pkgdir/usr/bin/pharo

	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	install icon-512x512.png $pkgdir/usr/share/pixmaps/$pkgname.png

	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

	chgrp -R users $pkgdir/opt/pharo/
	chmod -R 775 $pkgdir/opt/pharo
}
