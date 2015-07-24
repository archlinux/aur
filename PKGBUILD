# Contributor: Mark Coolen <mark.coolen@gmail.com>

pkgname="jazz-jackrabbit-2"
pkgver="1.0"
pkgrel=2
pkgdesc="A classic platform scroller from Abandonia, played in Wine."
url='http://www.abandonia.com/en/games/294/Jazz+Jackrabbit+2.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='jazz2.install'
depends=('wine' 'unionfs-fuse')
optdepends=('abandonia-menu')
source=('Jazz_Jackrabbit_2.zip::http://files.abandonia.com/download.php?game=Jazz+Jackrabbit+2&secure=ce95c11a306aa2eeaadff7b0e973e3fa&td=1304618652')
md5sums=('df245a8185fc2c0f8278b88d2ed9ee7a')
_pkgabbrev="Jazz2"
_exe="Jazz2.exe"
_icon=/opt/abandonia/$_pkgabbrev/HTML/jazz.gif

build() {
	mkdir -p -m755 "$pkgdir/opt/" 
	mkdir -p -m755 "$pkgdir/opt/abandonia" 
	mkdir -p -m755 "$pkgdir/opt/abandonia/$_pkgabbrev"

	#remove wineprefix files from previous incarnation of Jazz2
	if [ -d $pkgdir/opt/abandonia/$_pkgabbrev/drive_c ];then
		rm -rf $pkgdir/opt/abandonia/$_pkgabbrev/drive_c
		rm -rf $pkgdir/opt/abandonia/$_pkgabbrev/dosdevices
	fi

	cp -ar $srcdir/$_pkgabbrev/* $pkgdir/opt/abandonia/$_pkgabbrev
}

package() {

	#ok, let's use a script to start the game
        #script also includes unionfs mount in order to allow multi-user playing of this game from a single install.

	mkdir -p -m755 /$pkgdir/usr/bin/ 

	printf "#!${SHELL}
mkdir -p ~/.abandonia/$_pkgabbrev/Game

#copy old game files into new game directory... if they exist
if [ -d ~/.abandonia/$_pkgabbrev/persistent/drive_c/Programs/Jazz2 ];then
	cp -ar ~/.abandonia/$_pkgabbrev/persistent/drive_c/Programs/Jazz2/* ~/.abandonia/$_pkgabbrev/Game/
	#clean up leftover unionfs files from previous incarnation of Jazz2
	rm -rf ~/.abandonia/$_pkgabbrev/persistent
fi

#Make sure ~/.abandonia/$_pkgabbrev/temp is empty to avoid errors
rm -rf ~/.abandonia/$_pkgabbrev/temp
mkdir -p ~/.abandonia/$_pkgabbrev/temp

#Set up unionfs mount for game folder
unionfs -o cow -o umask=000 ~/.abandonia/$_pkgabbrev/Game=RW:/opt/abandonia/$_pkgabbrev=RO ~/.abandonia/$_pkgabbrev/temp
#cd ~/.abandonia/$_pkgabbrev/temp
" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 

#Different wine commandline for diffent arch's
if [ "$CARCH" = "x86_64" ] ; then
	printf	"WINEARCH=win32 WINEPREFIX=~/.abandonia/$_pkgabbrev wine ~/.abandonia/$_pkgabbrev/temp/$_exe" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 
else
	printf	"WINEPREFIX=~/.abandonia/$_pkgabbrev wine ~/.abandonia/$_pkgabbrev/temp/$_exe" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 
fi

printf "
#cd ~/
#Wait for a few seconds and then unmount the unionfs mountpoint
sleep 7 && fusermount -u ~/.abandonia/$_pkgabbrev/temp
" >> /$pkgdir/usr/bin/$_pkgabbrev.sh 

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
Icon=$_icon
Categories=Game;Abandonia;
Terminal=false
StartupNotify=false" >> /$pkgdir/usr/share/applications/$_pkgabbrev.desktop

}