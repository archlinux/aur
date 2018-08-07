# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Baobab <baobab//heresiarch.info>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=impro-visor
pkgver=10.0
pkgrel=1
pkgdesc="Jazz Improvisation Advisor for the Improviser"
arch=('any')
url="http://impro-visor.com/"
license=('GPL')
depends=('java-environment')
makedepends=('zip' 'unzip')
source=(https://downloads.sourceforge.net/impro-visor/Impro-Visor%2010%20Release/improvisor1000.zip
		https://downloads.sourceforge.net/impro-visor/Impro-Visor%2010%20Release/improvisor1000-src.zip
		$pkgname.sh
	    $pkgname.desktop
		directories.patch)
noextract=(improvisor1000-src.zip)
sha1sums=('56e862649c4685952c8407b013323200b028571e'
          '6816a8abc503cd2144c71f00df4159d8836e0b43'
          '69bbb3475ad3da37266b7e9dd4a6485b233054f2'
          '416b29ae38cb3f8d4589a0ab506c5b52063dae35'
          'e4922056ccb13ac9dad09a8e6c3b9cf228f5238c')
         
package() {
	cd "$srcdir"
	# apply config location patch
	unzip "improvisor1000-src.zip" "imp/Directories.java"
	cd "$srcdir/imp"
	patch -Np1 -i ../directories.patch
	javac Directories.java
	rm Directories.java
	cd ..
	zip -r -q improvisor.jar imp
	rm -rf imp
	# install readme & license
	install -Dm644 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm *.txt
	# install files
    find . -type f -name "*.jar" | while read f; do
		install -Dm644 "$f" "$pkgdir/usr/share/java/$pkgname/${f:2}"
		rm "$f"
	done
	find . -type f ! -name "*.jar" | while read f; do
		install -Dm644 "$f" "$pkgdir/usr/share/$pkgname/${f:2}"
	done
	# install script, launcher & icon
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	unzip -j "improvisor1000-src.zip" "imp/gui/graphics/icons/trumpetsmall.png"
	install -Dm644 "$srcdir/trumpetsmall.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
