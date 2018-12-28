# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Baobab <baobab//heresiarch.info>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=impro-visor
pkgver=10.1
_ver_src=1010 # FFS!
_ver_bin=10_1 # FFS!!
pkgrel=1
pkgdesc="Jazz Improvisation Advisor for the Improviser"
arch=('any')
url="http://impro-visor.com/"
license=('GPL')
depends=('java-environment')
makedepends=('zip' 'unzip')
source=("https://downloads.sourceforge.net/impro-visor/Impro-Visor%20${pkgver}%20Release/Impro-Visor_unix_${_ver_bin}.tar.gz"
		"https://downloads.sourceforge.net/impro-visor/Impro-Visor%20${pkgver}%20Release/improvisor${_ver_src}-src.zip"
		"$pkgname.sh"
		"$pkgname.desktop"
		"directories.patch")
noextract=("improvisor${_ver_src}-src.zip")
OPTIONS=(!strip)
sha1sums=('36219ad87b42b58eb35124f158212bd9c9b5e7ae'
          'aa7f607ac3765ce4f23f6f8ced5a9ef6bcfe7b1f'
          '69bbb3475ad3da37266b7e9dd4a6485b233054f2'
          '416b29ae38cb3f8d4589a0ab506c5b52063dae35'
          'e4922056ccb13ac9dad09a8e6c3b9cf228f5238c')

package() {
	cd "$srcdir/Impro-Visor${pkgver}"
	# apply config location patch
	unzip "$srcdir/improvisor${_ver_src}-src.zip" "imp/Directories.java"
	cd "imp"
	patch -Np1 -i "../../directories.patch"
	javac Directories.java
	rm Directories.java
	cd ..
	zip -r -q "improvisor.jar" "imp"
	rm -rf imp
	# install readme & license
	install -Dm644 "README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm *.txt impro-visor impro-visor.vmoptions
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
	unzip -j "$srcdir/improvisor${_ver_src}-src.zip" "imp/gui/graphics/icons/trumpetsmall.png"
	install -Dm644 "trumpetsmall.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
