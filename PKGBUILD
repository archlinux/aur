# Contributor: Jens Staal <staal1978@gmail.com>
#              abbradar (AUR)

pkgname="legend-of-kyrandia-3"
pkgver="3.0"
pkgrel=7
pkgdesc="A classic adventure game, played in ScummVM."
url='http://www.emuparadise.me/ScummVM_Games/The_Legend_of_Kyrandia_3_Malcolm%27s_Revenge_(CD_DOS,_Multilanguage)/96018'
arch=('any')
license=('custom-freeware' 'Abandonware')
install='kyrandia3.install'
depends=('scummvm')
source=("$pkgname.zip::http://50.7.161.234/bks/new/ScummVM/Working/The%20Legend%20of%20Kyrandia%203%20Malcolm's%20Revenge%20(CD%20DOS,%20Multilanguage).zip"
        "Kyrandia3.jpg"
        "http://scummvm.svn.sourceforge.net/svnroot/scummvm/scummvm/tags/release-1-2-1/dists/engine-data/kyra.dat")
noextract=("$pkgname.zip")
_pkgabbrev="Kyrandia3"
_exe="kyra3"
_icon="Kyrandia3.jpg"

prepare() {
  cd "$srcdir"
  mkdir kyrandia
  bsdtar -xf $pkgname.zip -C "kyrandia"
}

package() {
  cd "$srcdir"
  mkdir -p -m755 "$pkgdir/opt/scummvm/$_pkgabbrev"
  cp -ar $srcdir/kyrandia/* "$pkgdir/opt/scummvm/$_pkgabbrev"
  cp -arL "$srcdir/kyra.dat" "$pkgdir/opt/scummvm/$_pkgabbrev/KYRA.DAT"
  cp -arL "$srcdir/$_icon" "$pkgdir/opt/scummvm/$_pkgabbrev"

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
Icon=/opt/$_pkgabbrev/$_icon
Categories=Game;
Terminal=false
StartupNotify=false" >> /$pkgdir/usr/share/applications/$_pkgabbrev.desktop
}

sha1sums=('c54ef1f6feea67081b77f49c5c2a641d4968f680'
          '9ef63a5de779052aec25bda3fdfec1feac4488b8'
          '1827c7532174322f02c2683c8a15dbc7d1d69412')
