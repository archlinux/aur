#
# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
#
pkgname=steamband
pkgver=0.4.1f
_dir="Steamband $pkgver SRC"
pkgrel=5
pkgdesc="a Steampunk / Victorian / Pulp variant of Angband, A roguelike ASCII dungeon exploration simulation game."
arch=('i686' 'x86_64')
url="http://angband.oook.cz/steamband/steamband.html"
license=('unknown')
depends=('ncurses' 'libx11' 'slang')
options=('ccache' 'emptydirs')
source=("http://angband.oook.cz/steamband/Steamband-041f-SRC.zip")
md5sums=('14fd9bc6f218bb655e0dc247793f7a87')
 
prepare () {
    
  cd "$srcdir/$_dir/src"
  sed -e '175,180d' Makefile.std > Makefile

  sed -i 's|\(# define DEFAULT_PATH\) .*$|\1 "/usr/lib/steamband/"|' config.h
  # CPPFLAGS="-DDEFAULT_PATH=/usr/lib/steamband/"

  #sed -r ':begin; $!N; s/#(CFLAGS = -Wall -O1 -pipe -g -D"USE_X11" -D"USE_GCU")\n#(LIBS = -lX11 -lcurses) -ltermcaip/\1\n\2/' -i Makefile
}

build () {
  cd "$srcdir/$_dir/src"
  make -f Makefile.std
}

package () {
  cd "$srcdir/$_dir"
 
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -d "$pkgdir/usr/lib/$pkgname/"{edit,bone,file,help,info,pref,spoiler,testing,user}
  install -d "$pkgdir/usr/lib/$pkgname/xtra/"{font,graf,sound}

  # todo, something more clever with install
  # but less clever than the old version
  cp lib/edit/*.txt  "$pkgdir/usr/lib/$pkgname/edit/"
  cp lib/file/*.txt  "$pkgdir/usr/lib/$pkgname/file/"
  cp lib/help/*.txt  "$pkgdir/usr/lib/$pkgname/help/"
  cp lib/help/*.hlp  "$pkgdir/usr/lib/$pkgname/help/"
  cp lib/pref/*      "$pkgdir/usr/lib/$pkgname/pref/"
  cp lib/spoiler/*   "$pkgdir/usr/lib/$pkgname/spoiler/"
  cp lib/xtra/font/* "$pkgdir/usr/lib/$pkgname/xtra/font/"

  install -dm 775 "$pkgdir/usr/lib/$pkgname/"{apex,save,data}

  pushd src
  install -m 755 -t "$pkgdir/usr/bin" $pkgname
  popd
  
  install -m 644 -t "$pkgdir/usr/share/doc/$pkgname" \
      changelist.txt \
      porting\ readme.txt \
      readme.txt
  
  chown -R root:games "$pkgdir/usr/lib/$pkgname/"
}

