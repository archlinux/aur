# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=ow-curses-win32a
pkgdesc="An extended PDCurses directly on Win32 api (watcom-win32)"
groups=('watcom-win32' 'watcom-win16')
pkgver=15.05 #date of last release year.month
pkgrel=1
arch=('any')
license=('custom: Public Domain')
depends=(openwatcom-v2)
makedepends=(openwatcom-v2)
provides=("watcom-curses-win32" "watcom-curses-win16")
#win16 does not build
url="http://www.projectpluto.com/win32a.htm"
source=("http://www.projectpluto.com/win32a.zip")
options=(!strip !buildflags staticlibs emptydirs)
md5sums=('835356e2ffa311c5bb908063cfda7dfa')

build() {
  cd "$srcdir"/win32a
  source /opt/watcom/owsetenv.sh
  
  #hacking away windowsisms from the makefile...
  sed 's|SRCDIR)\\|SRCDIR)\/|g' -i "$srcdir"/watcom.mif
  cp "$srcdir"/*.h "$srcdir"/pdcurses/
  sed 's|SRCDIR)\\|SRCDIR)\/|g' -i wccwin*.mak
  sed 's|copy |cp |g' -i wccwin*.mak
  sed 's|-ei -zq -wx -i=|-ei -zq -wx -fo=.obj -i=|g' -i wccwin*.mak
  sed 's|-oneatx|-oneatx -aa -D__wargv=NULL|g' -i wccwin*.mak #not present in win headers
  #sed 's|\/DPDC_WIDE|-DPDC_WIDE|g' -i wccwin*.mak
  #sed 's|\/DPDC_FORCE_UTF8|-DPDC_FORCE_UTF8|g' -i wccwin*.mak
  
  export PDCURSES_SRCDIR="$srcdir"
    
  #msg "build for Win16..." 
  #export INCLUDE=$WATCOM/h:$WATCOM/h/win
  #wmake -f wccwin16.mak pdcurses.lib
  #mv pdcurses.lib curses.lib16
  #rm -f panel.lib
  #rm -f *.obj
  
  msg "build for Win32..."
  export INCLUDE=$WATCOM/h:$WATCOM/h/nt
  wmake -f wccwin32.mak pdcurses.lib
  rm -f panel.lib
 }

package() {
  cd "$srcdir/win32a"
  mkdir -p "${pkgdir}${WATCOM}"/{lib286/win,lib386/nt,h/{nt,win}}/
  chmod -R 755 "$pkgdir/opt"
  install -m644 pdcurses.lib "${pkgdir}${WATCOM}"/lib386/nt/
  cp "${pkgdir}${WATCOM}"/lib386/nt/pdcurses.lib "${pkgdir}${WATCOM}"/lib386/nt/panel.lib
  #install -m644 curses.lib16 ${pkgdir}${WATCOM}/lib286/win/{pdcurses,panel}.lib
  install -m644 "$srcdir"/*.h "${pkgdir}${WATCOM}"/h/win/
  install -m644 "$srcdir"/*.h "${pkgdir}${WATCOM}"/h/nt/
}

