# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Baobab <baobab//heresiarch.info>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=impro-visor
pkgver=7.0a
_pkgver=7.0
pkgrel=1
pkgdesc="Jazz Improvisation Advisor for the Improviser"
arch=('any')
url="http://impro-visor.com/"
license=('GPL')
depends=('java-environment')
makedepends=('zip' 'unzip')
install="impro-visor.install"
#source=(http://downloads.sourceforge.net/${pkgname}/Impro-Visor%20$pkgver%20Release/${pkgname/-}${pkgver/.}0.zip
#	http://downloads.sourceforge.net/${pkgname}/Impro-Visor%20$pkgver%20Release/${pkgname/-}${pkgver/.}0-src.zip
source=(http://downloads.sourceforge.net/impro-visor/Impro-Visor%207.0a%20Release%20%28bug-fix%20for%20WIndows%207%29/improvisor700.zip
	http://downloads.sourceforge.net/impro-visor/Impro-Visor%207.0a%20Release%20%28bug-fix%20for%20WIndows%207%29/improvisor700-src.zip
	$pkgname.sh
	$pkgname.desktop
	directories.patch)
noextract=(${pkgname/-}${_pkgver/.}0-src.zip)
sha1sums=('ed772397d4d4615aeadcaddd7a41b675df0d1250'
          'bbc56babeb650f10c302b1694b38fa92f0839c26'
          '69bbb3475ad3da37266b7e9dd4a6485b233054f2'
          '416b29ae38cb3f8d4589a0ab506c5b52063dae35'
          'e4922056ccb13ac9dad09a8e6c3b9cf228f5238c')
         
package() {
	cd "$srcdir"
	# apply config location patch
	unzip "${pkgname/-}${_pkgver/.}0-src.zip" "imp/Directories.java"
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
	unzip -j "${pkgname/-}${_pkgver/.}0-src.zip" "imp/gui/graphics/icons/trumpetsmall.png"
	install -Dm644 "$srcdir/trumpetsmall.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
