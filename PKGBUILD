# Contributor: Jens Staal <staal1978@gmail.com>
#              abbradar (AUR)

pkgname="legend-of-kyrandia-2"
pkgver="2.0"
pkgrel=7
pkgdesc="A classic adventure game from Abandonia, played in ScummVM."
url='http://www.abandonia.com/en/games/292/Legend+of+Kyrandia+2+-+Hand+of+Fate,+The.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='kyrandia2.install'
depends=('scummvm')
optdepends=('abandonia-menu')
source=('http://files.abandonia.com/download.php?game=Legend+of+Kyrandia+2+-+Hand+of+Fate%2C+The&secure=155bd57dc343f2682b5ad70f03253a14&td=1297714059' 'http://scummvm.svn.sourceforge.net/svnroot/scummvm/scummvm/tags/release-1-2-1/dists/engine-data/kyra.dat')
md5sums=('07b796be342c04c34cf7b1151aa71656' 'a81223603341f8c59285753e91665e2f')
_pkgabbrev="Kyrandia2"
_exe="kyra2"
_icon="HAND.ICO"

build() {
	mkdir -p -m755 "$pkgdir/opt/scummvm/$_pkgabbrev"
	cp -ar $srcdir/HOFCD/CD/HOF_CD/* "$pkgdir/opt/scummvm/$_pkgabbrev"
	cp -arL $srcdir/kyra.dat $pkgdir/opt/scummvm/$_pkgabbrev/KYRA.DAT

	#ok, let's use a script to start the game

	mkdir -p -m755 /$pkgdir/usr/bin/

	printf "#!/bin/bash
if whereis scummvm>/dev/null 2>&1;
	then
		mkdir -p ~/.scummvm/$_pkgabbrev
		scummvm -F --savepath=~/.scummvm/$_pkgabbrev --path=/opt/scummvm/$_pkgabbrev/ $_exe
	else
		echo '==> Please get sure to have ScummVM installed and have it in your PATH array.'
fi
exit \$?" >> /$pkgdir/usr/bin/$_pkgabbrev
	chmod +x /$pkgdir/usr/bin/$_pkgabbrev

	# Automatic generation of a .desktop file

	mkdir -p -m755 "$pkgdir/usr/share/applications/"

	printf "[Desktop Entry]
Version=$pkgver
Type=Application
Name=$pkgname
Comment=$pkgdesc
Exec=/usr/bin/$_pkgabbrev
Icon=/opt/scummvm/$_pkgabbrev/$_icon
Categories=Game;Abandonia;
Terminal=false
StartupNotify=false" >> /$pkgdir/usr/share/applications/$_pkgabbrev.desktop
}
