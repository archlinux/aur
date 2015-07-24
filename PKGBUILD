# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Mark Coolen <mark.coolen@gmail.com>

pkgname="the-incredible-machine-2"
pkgver="1.0"
pkgrel=4
pkgdesc="A classic puzzle game from Abandonia, played in DosBox."
url='http://www.abandonia.com/en/games/395/Incredible+Machine+2,+The.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='tim2.install'
depends=('dosbox' 'unionfs-fuse')
optdepends=('abandonia-menu')
source=('The_Incredible_Machine_2.zip::http://files.abandonia.com/download.php?game=Incredible+Machine+2%2C+The&secure=98ddb7b4cd755918180065de92319f8f&td=1297665430' 'TIM2.png')
md5sums=('b0e1b4e0f7000a49ef9bb2920ab288a4' 'cd42b0e995ef697377ef8e05fd7092b5')
_pkgabbrev="TIM2"
_exe="TIM2.EXE"
_icon="TIM2.png"

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev" 
	rm -f $srcdir/download* 
	cp -ar $srcdir/the\ incredible\ machine\ 2/* "$pkgdir/opt/abandonia/$_pkgabbrev" 

	#ok, let's use a script to start the game

	mkdir -p -m755 /$pkgdir/usr/bin/ 
	printf "#!${SHELL}
if whereis unionfs-fuse>/dev/null 2>&1;
    then
	if whereis dosbox>/dev/null 2>&1;
		then
			mkdir -p ~/.abandonia/$_pkgabbrev/temp
			mkdir -p ~/.abandonia/$_pkgabbrev/persistent
			unionfs -o cow -o umask=000 ~/.abandonia/$_pkgabbrev/persistent=RW:/opt/abandonia/$_pkgabbrev=RO ~/.abandonia/$_pkgabbrev/temp
			dosbox ~/.abandonia/$_pkgabbrev/temp/$_exe
			fusermount -u ~/.abandonia/$_pkgabbrev/temp			
		else
			echo '==> Please be sure to have dosbox installed and in your PATH.'
	fi
    else
 	echo '==> Please be sure to have unionfs-fuse installed and in your PATH.'
fi
return \$?" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 
	chmod +x /$pkgdir/usr/bin/$_pkgabbrev.sh 
	ln -s $_pkgabbrev.sh /$pkgdir/usr/bin/$_pkgabbrev 

	# Automatic generation of a .desktop file

	mkdir -p -m644 "$pkgdir/usr/share/" 
	mkdir -p -m644 "$pkgdir/usr/share/applications/" 

	printf "[Desktop Entry]
Version=$pkgver
Type=Application
Name=$pkgname
Comment=$pkgdesc
Exec=/usr/bin/$_pkgabbrev
Icon=/opt/abandonia/$_pkgabbrev/$_icon
Categories=Game;Abandonia;
Terminal=false
StartupNotify=false" >> /$pkgdir/usr/share/applications/$_pkgabbrev.desktop
} 
