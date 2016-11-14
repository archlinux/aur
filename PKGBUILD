# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Baobab <baobab//heresiarch.info>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=impro-visor
pkgver=8.11
pkgrel=1
pkgdesc="Jazz Improvisation Advisor for the Improviser"
arch=('any')
url="http://impro-visor.com/"
license=('GPL')
depends=('java-environment')
makedepends=('zip' 'unzip')
source=(https://downloads.sourceforge.net/impro-visor/Impro-Visor%208.11%20Release%20%28bug-fix%20for%20Active%20Trading%29/improvisor811.zip
		https://downloads.sourceforge.net/impro-visor/Impro-Visor%208.11%20Release%20%28bug-fix%20for%20Active%20Trading%29/improvisor811-src.zip
		$pkgname.sh
	    $pkgname.desktop
		directories.patch)
noextract=(improvisor811-src.zip)
sha1sums=('427d8f5c4949ef6965e2f15b732051b562fd272e'
          'd664cb1c94b02b8996efbc7250effe07f12c47c7'
          '69bbb3475ad3da37266b7e9dd4a6485b233054f2'
          '416b29ae38cb3f8d4589a0ab506c5b52063dae35'
          'e4922056ccb13ac9dad09a8e6c3b9cf228f5238c')
         
package() {
	cd "$srcdir"
	# apply config location patch
	unzip "${pkgname/-}${pkgver/.}-src.zip" "imp/Directories.java"
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
	unzip -j "${pkgname/-}${pkgver/.}-src.zip" "imp/gui/graphics/icons/trumpetsmall.png"
	install -Dm644 "$srcdir/trumpetsmall.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
