# Maintainer: Rafael Cruz <rafaelcruz at outlook dot com>

pkgname=red-ggpo
pkgver=1
pkgrel=1
pkgdesc='New online arcade gaming platform using lastest GGPO technology and netcode.'
url='https://redggpo.com/'
arch=('any')
license=('custom')
depends=(wine lib32-mpg123 xdg-utils gconf)
makedepends=(gendesk rsync icoutils)
_tmpappfolder="GGFBN"
_execscript="start.sh"
_execapp="ggfbn.exe"
_wineprefix="prefix"
source=(
	$pkgname.zip::https://raw.githubusercontent.com/han0idx/emu/master/ggfbneo.v01.zip
	$_execscript::https://raw.githubusercontent.com/rafaelcruzpb/red-ggpo-linux/master/start-with-wineprefix.sh
	icon.png::https://raw.githubusercontent.com/rafaelcruzpb/red-ggpo-linux/master/icon.png
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

prepare() {
	[ -f "$srcdir/$_execscript" ] && cp "$srcdir/$_execscript" "$srcdir/$_tmpappfolder/$_execscript"
    msg "Generating menu shortcut..."
	if [ -x /usr/bin/xdg-mime ]; then
		echo "[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Red GGPO Emulator
Exec=/opt/$pkgname/$_execscript %U
Icon=$pkgname
Terminal=false
MimeType=x-scheme-handler/ggpo
		" > $srcdir/$pkgname.desktop
		xdg-mime default $pkgname.desktop x-scheme-handler/ggpo
	fi
}

package() {
    install -dm755 $HOME/.$pkgname/
	install -dm755 $pkgdir/opt/
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	msg "Copying files..."
	rsync -r --chmod=755 $srcdir/$_tmpappfolder/* $pkgdir/opt/$pkgname/
	chown -R $USER:users $pkgdir/opt/$pkgname/
}
