#Maintainer: jacobmischka <jacobmischka@gmail.com>
#Contributor: float <flo.at at gmx dot de>

pkgname=loderunner
pkgver=1.50
pkgrel=5
pkgdesc="Lode Runner Online: Mad Monks' Revenge. A puzzle video game from 1995"
arch=('any')
url=http://www.daggert.net/Folio/Programming/Presage/LodeRunner/Loderunner1.htm
license=('custom-freeware Abandonware')
depends=(wine winetricks unionfs-fuse xorg-xrefresh)
makedepends=(imagemagick)
options=(!strip)
install=$pkgname.install
_install_dir=${XDG_DATA_HOME:-${HOME}/.local/share}/${pkgname}
source=(http://www.daggert.net/Folio/Programming/Presage/LodeRunner/Downloads/lro_install.zip)
md5sums=('ea39770395db0998b3dc3cad052a1977')

package() {
  #copy game files
  install -d -m755 "$pkgdir"/usr/share/"$pkgname"/
  cp -ra -t "$pkgdir"/usr/share/"$pkgname"/ "$srcdir"/MMRInstall/DATA \
"$srcdir"/MMRInstall/PUZZLES "$srcdir"/MMRInstall/SAVEGAME \
"$srcdir"/MMRInstall/SIERRA.INF "$srcdir"/MMRInstall/LODER1_5.TXT
  cp -ra "$srcdir"/MMRInstall/ENGLISH/LANGUAGE.INF "$pkgdir"/usr/share/"$pkgname"/
  cp -ra "$srcdir"/MMRInstall/FILES/BALLOONH.DLL "$pkgdir"/usr/share/"$pkgname"/
  cp -ra "$srcdir"/MMRInstall/FILES/LODERUNN.EXE "$pkgdir"/usr/share/"$pkgname"/

  #create support file
  cat << EOF > "$pkgdir"/usr/share/"$pkgname"/SIERRA.INI
[LodeRunner_Online]
InstallPath=C:\lro
CDPath=C:\lro
Type=FULL

EOF

  install -d -m755 "$pkgdir"/usr/share/applications/
  cat << EOF > "$pkgdir"/usr/share/applications/"$pkgname".desktop
[Desktop Entry]
Exec=$pkgname
Icon=$pkgname
Type=Application
Categories=Game;LogicGame;
Name=Lode Runner Online
Comment=Mad Monks' Revenge
StartupNotify=false
Terminal=false

EOF

  install -d -m755 "$pkgdir"/usr/bin/
  cat << EOF > "$pkgdir"/usr/bin/"$pkgname"
#!/bin/bash
set -e

function atexit {
	fusermount -zu $_install_dir/lro/
	xrefresh
	echo "Goodbye from Lode Runner!"
	exit 0
}

export WINEARCH=win32
export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEPREFIX=$_install_dir/winefs
export WINEDEBUG=-all

echo "Starting..."

if [ ! -d $_install_dir/ ] ;then
	echo "Initializing the wine prefix."
	mkdir -p $_install_dir/lro
	cd $_install_dir
	#setup wine prefix
	mkdir lro_diff
	wineboot -u
	echo "Using winetricks to configure the prefix."
	[ -x /usr/bin/winetricks ] && winetricks sandbox && winetricks win98 && winetricks vd=640x480
	#setup symlinks
	cd winefs/dosdevices
	ln -s ../../ x:
	#copy support file
	cp /usr/share/$pkgname/SIERRA.INI $_install_dir/winefs/drive_c/windows/
	sleep 5
fi

#mount lro at drive x:
unionfs -o relaxed_permissions -o cow $_install_dir/lro_diff/=RW:/usr/share/$pkgname=RO $_install_dir/lro/
trap atexit SIGHUP SIGINT SIGTERM EXIT

cd $_install_dir/winefs/dosdevices/x:/lro/
wine 'x:\lro\LODERUNN.EXE' "\$@" &>/dev/null

EOF

  #create icon
  install -d -m755 "$pkgdir"/usr/share/pixmaps/
  convert "$srcdir"/MMRInstall/FILES/LODEGUY.ICO "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm

  #set permissions
  find "$pkgdir"/usr/ -type d -exec chmod 755 "{}" \;
  find "$pkgdir"/usr/ -type f -exec chmod 644 "{}" \;

  chmod 755 "$pkgdir"/usr/bin/"$pkgname"

  return 0
}
