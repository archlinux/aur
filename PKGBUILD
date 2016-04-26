# Maintainer: Leonidas Arvanitis <l.arvanitis@gmail.com>

_pkgname=subtitleedit
_pkgver=3.4.12
_zipname="SE${_pkgver//./}.zip"

pkgname=$_pkgname-bin
pkgver=$_pkgver
pkgrel=1
pkgdesc="A free editor for video subtitles (running on mono)"
arch=('i686' 'x86_64')
url="http://www.nikse.dk/SubtitleEdit"
license=('GPL3')
depends=('mono')
optdepends=('vlc: video support'
	'hicolor-icon-theme: icon file hierarchy'
	'desktop-file-utils: update desktop MIME database'
	'shared-mime-info: update MIME database'
	'xdg-utils: update icon cache')
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
source=("https://github.com/SubtitleEdit/$_pkgname/releases/download/$pkgver/$_zipname"
	$_pkgname.desktop
	$_pkgname.png
	$_pkgname.sh)
sha1sums=('b2215e3c579d62901dda0b68f534dfa9fbc26527'
	'90ea38fe066ea5f4bc62ed61c35dbbbd9182be82'
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
