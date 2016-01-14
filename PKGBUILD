# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=pharo
pkgver=4.0.626
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
vmversion=stable

source=(http://files.pharo.org/vm/pharo/linux/${vmversion}.zip \
	http://files.pharo.org/image/stable/${imageversion}.zip\
	http://files.pharo.org/media/logo/icon-512x512.png\
	http://files.pharo.org/sources/PharoV40.sources.zip\
	$pkgname.sh
	 $pkgname.desktop)

sha256sums=('e525ded202ac0e9f7a2db38fbe32ac07bca2d2e6ef90b17fd08f438d40a4f1f9'\
	'ea1e6a93bd33eb1552c1f36df5c1525a9d91da578ba23b56e85e3add265dd18f'\
	'5a6f40722264a2befc9aea1dace399f2491cd45a98987458660f8a39d4e6887e'\
	'ed5a2c1b729c5cd5825841a4691affe81d2c121467e488f2bb30058a833801f7'\
	'd20142129bdba703fde4d7f355f516d47e284d93d4d0536a0d8d34d850a06094'\
	'ad37a9c7d05b72a1d0375de7b7056dfcb220e2bef6358a99b6075ae6f66905f6')

package() {
	cd $srcdir
	unzip $vmversion.zip -d bin

	mkdir -p $pkgdir/opt/pharo/shared
	mkdir -p $pkgdir/usr/bin

	cp -R bin $pkgdir/opt/pharo
	install $pkgname.sh $pkgdir/opt/pharo/pharo
	install Pharo-${imageversion}.changes $pkgdir/opt/pharo/shared/Pharo4.0.changes
	install Pharo-${imageversion}.image $pkgdir/opt/pharo/shared/Pharo4.0.image
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
