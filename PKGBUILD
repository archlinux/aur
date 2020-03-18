# Maintainer: pescepalla < base64 -d <<< cGVzY2VwYWxsYUBwb3N0ZW8ubWUK >

pkgname=cmaptools
pkgver=v6.04
_pkgdate=09-24-19
pkgrel=1
pkgdesc="The IHMC Cmap Tools for concept maps"
arch=('x86_64')
url="http://cmap.ihmc.us/"
license=('unknown')
depends=('java-environment>=7' 
        'java-environment<9')
makedepends=('the_silver_searcher')

source=(http://cmapdownload.ihmc.us/installs/CmapTools/Linux/Linux64CmapTools_$pkgver\_$_pkgdate.bin
	installer.properties
	icon.png
	cmaptools.desktop
	cmaptools
	)

md5sums=('5e7c9557f37bb3510d2fe0d168d1e847'
	'a6aa32dfa1a7a5bc5e6dc585e197e002'
	'c37998dc8a4703de169283d49a49c40d'
	'23f9a626c04321284930d6a79b2cf5b1'
	'772e8c9d9be5e9728f32b1a8adcc10ba'
	)


package() {
	mkdir -p $pkgdir/opt/cmaptools

	# Start installer in silent mode (see
	# http://cmap.ihmc.us/docs/cmaptools-console-silent-installation.php for
	# silent installation instructions)
	chmod +x Linux64CmapTools_$pkgver\_$_pkgdate.bin
	./Linux64CmapTools_$pkgver\_$_pkgdate.bin \
		-f $PWD/installer.properties \
		-DUSER_INSTALL_DIR=$pkgdir/opt/cmaptools \
		-DUSER_SHORTCUTS=$pkgdir/usr/share/applications \
	|| true

	# Remove useless symbolic links
	rm $pkgdir/opt/cmaptools/Uninstall\ CmapTools
	rm $pkgdir/opt/cmaptools/CmapTools

	# Remove useless uninstaller
	rm -r $pkgdir/opt/cmaptools/UninstallerData

	# Copy icon
	install -Dm644 icon.png $pkgdir/opt/cmaptools/icon.png

	# Copy desktop file
	install -Dm644 cmaptools.desktop $pkgdir/usr/share/applications/cmaptools.desktop

	# Copy bash executable to path
	install -Dm755 cmaptools $pkgdir/usr/bin/cmaptools

	# Fix references to $pkgdir because installer is dumb
	cd $pkgdir
	ag $pkgdir -l --print0 | xargs -0 sed -i "s=$pkgdir=/opt=g"

	# Remove embedded JRE
	rm -r $pkgdir/opt/cmaptools/jre

	# Clean file rights
	find $pkgdir/opt/cmaptools -type d -print0 | xargs -0 chmod 755
	find $pkgdir/opt/cmaptools -type f -print0 | xargs -0 chmod 644
	chmod 755 $pkgdir/opt/cmaptools/bin/CmapTools
}
