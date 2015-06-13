# Contributors: Jens Staal <staal1978@gmail.com> ;
#               abbradar (AUR)

pkgname="legend-of-kyrandia-1"
pkgver="1.0"
pkgrel=7
pkgdesc="A classic adventure game from Abandonia, played in ScummVM."
url='http://www.abandonia.com/en/games/88/Legend+of+Kyrandia+1,+The.html'
arch=('any')
license=('custom-freeware' 'Abandonware')
depends=('scummvm')
optdepends=('abandonia-menu')
install='kyrandia1.install'
source=('http://files.abandonia.com/download.php?game=Legend+of+Kyrandia+1%2C+The&secure=ae25b70ce9dc58743433d6dbfc2a706e&td=1297713450' 'http://scummvm.svn.sourceforge.net/svnroot/scummvm/scummvm/tags/release-1-2-1/dists/engine-data/kyra.dat')
md5sums=('a83967cfda7dbc1ad88512876305f742' 'a81223603341f8c59285753e91665e2f')
_pkgabbrev="Kyrandia1"
_exe="kyra1"
_icon="KYRANDIA.ICO"

package() {
  mkdir -p -m755 "$pkgdir/opt/scummvm/$_pkgabbrev"
  cp -ar $srcdir/KYRACD/CD/ENG/1/* "$pkgdir/opt/scummvm/$_pkgabbrev"
  cp -arn $srcdir/KYRACD/CD/ENG/2/* "$pkgdir/opt/scummvm/$_pkgabbrev"
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
Icon=/opt/abandonia/$_pkgabbrev/$_icon
Categories=Game;Abandonia;
Terminal=false
StartupNotify=false" >> /$pkgdir/usr/share/applications/$_pkgabbrev.desktop
}
