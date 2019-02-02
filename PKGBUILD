# Maintainer: twa022 <twa022 at gmail dot com>

pkgname="midnight-rescue"
pkgver=1.0
pkgrel=2
pkgdesc="A classic educational game from Abandonia, played in DosBox."
url='https://www.myabandonware.com/game/super-solvers-midnight-rescue-1r5'
arch=('any')
license=('custom-freeware' 'Abandonware')
depends=('dosbox' 'unionfs-fuse')
source=('Midnight_Rescue.zip::http://files.abandonia.com/download.php?game=Super+Solvers+-+Midnight+Rescue&secure=da2b471ea49d5a02e5b2a87e4f8e34e5&td=1549091612')
#source=('Midnight_Rescue.zip::https://dl.myabandonware.com/t/yooULj75sK5af1ttNRoTZ4BN4CtFGGH9ymR4Z4kl43QC5m0X21/Super-Solvers-Midnight-Rescue_DOS_EN.zip')
sha256sums=('51a095a8093f549a653a67fc810d9cb385b0f81b8d1c2e0c8cf7fca0adc363c6')
_icon="midnight_rescue.png"

package() {

	install -d -m755 "$pkgdir/opt/abandonia/$pkgname" 
	cp -ar "$srcdir"/SSR/* "$pkgdir/opt/abandonia/$pkgname" 

	#ok, let's use a script to start the game

	install -d -m755 $pkgdir/usr/bin/ 
	cat <<- __EOF__ > "$pkgdir/usr/bin/$pkgname"
		#!/bin/sh
		if whereis unionfs-fuse>/dev/null 2>&1; then
			if whereis dosbox>/dev/null 2>&1; then
				mkdir -p ~/.abandonia/$pkgname/temp
				mkdir -p ~/.abandonia/$pkgname/persistent
				unionfs -o cow -o umask=000 ~/.abandonia/$pkgname/persistent=RW:/opt/abandonia/$pkgname=RO ~/.abandonia/$pkgname/temp
				dosbox ~/.abandonia/$pkgname/temp/SSR.EXE
				fusermount -u ~/.abandonia/$pkgname/temp			
			else
				echo '==> Please be sure to have dosbox installed and in your PATH.'
			fi
		else
			echo '==> Please be sure to have unionfs-fuse installed and in your PATH.'
		fi
	__EOF__
	chmod +x "$pkgdir/usr/bin/$pkgname"

	# Automatic generation of a .desktop file

	install -d -m755 "$pkgdir/usr/share/applications/" 

	cat <<- __EOF__ > "$pkgdir/usr/share/applications/$pkgname.desktop"
		[Desktop Entry]
		Version=Midnight Rescue
		Type=Application
		Name=Midnight Rescue
		Comment=$pkgdesc
		Exec=/usr/bin/$pkgname
		# Icon=/opt/abandonia/$pkgname/$_icon
		Categories=Game;Abandonia;
		Terminal=false
		StartupNotify=false
	__EOF__
}
