# Maintainer: Leonidas Arvanitis <l.arvanitis@gmail.com>

_pkgname=subtitleedit
_pkgver=3.4.13
_zipname="SE${_pkgver//./}.zip"

pkgname=$_pkgname-bin
pkgver=$_pkgver
pkgrel=1
pkgdesc="A free editor for video subtitles (running on mono)"
arch=('i686' 'x86_64')
url="http://www.nikse.dk/SubtitleEdit"
license=('GPL3')
depends=('mono')
optdepends=('vlc: video support')
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
source=("https://github.com/SubtitleEdit/$_pkgname/releases/download/$pkgver/$_zipname"
	$_pkgname.desktop
	$_pkgname.png
	$_pkgname.sh)
sha1sums=('d769c7684dbba4e876ddaa3564887e72d474f478'
	'6c27ad0b86ac2ef30cfe82fe4ac5d4099eea7dd1'
	'136eebf583acdc4af8bbfc82a06ee5634bf13052'
	'98827b12f571b1ca46ac96ef687d15480fa7390a')
noextract=("$_zipname")

package() {
	installDir="$pkgdir/opt/$_pkgname"
	mkdir -p "$installDir"

	# Application
	bsdtar -xf "$srcdir/$_zipname" -C "$installDir"
	find "$installDir" -type d -exec chmod 755 {} \;
	find "$installDir" -type f -exec chmod 644 {} \;
	touch "$installDir/.PACKAGE-MANAGER"

	# Application cleanup
	rm "$installDir/gpl.txt"

	if [ "$CARCH" == "i686" ]; then
		rm "$installDir/Hunspellx64.dll"
	else
		rm "$installDir/Hunspellx86.dll"
	fi

	# Desktop file
	install -D -m644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	# Appication icon
	install -D -m644 "$srcdir/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_pkgname.png"

	# System executable
	install -D -m755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
