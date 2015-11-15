# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=ow-curses-win32a
pkgdesc="An extended PDCurses directly on Win32 api (watcom-win32)"
groups=('watcom-win32' 'watcom-win16' 'watcom-dos')
pkgver=15.08 #date of last release year.month
pkgrel=1
arch=('any')
license=('custom: Public Domain')
depends=(openwatcom-v2)
makedepends=(openwatcom-v2)
provides=("watcom-curses-win32" "watcom-curses-win16" "watcom-curses-dos")
#win16 fails at the moment
url="http://www.projectpluto.com/win32a.htm"
source=("http://www.projectpluto.com/win32a.zip")
options=(!strip !buildflags staticlibs emptydirs)
md5sums=('e7613a470362920309245354f7e7a25d')

build() {
  cd "$srcdir"/win32a
  
  source /opt/watcom/owsetenv.sh
  
  #hacking away windowsisms from the makefile...
  sed 's|SRCDIR)\\|SRCDIR)\/|g' -i "$srcdir"/watcom.mif
  cp "$srcdir"/*.h "$srcdir"/pdcurses/
  sed 's|SRCDIR)\\|SRCDIR)\/|g' -i wccwin32.mak
  sed 's|copy |cp |g' -i wccwin32.mak
  sed 's|-ei -zq -wx -i=|-ei -zq -wx -fo=.obj -i=|g' -i wccwin32.mak
  sed 's|-oneatx|-oneatx -aa -D__wargv=NULL|g' -i wccwin32.mak #not present in win headers
  #sed 's|\/DPDC_WIDE|-DPDC_WIDE|g' -i wccwin*.mak
  #sed 's|\/DPDC_FORCE_UTF8|-DPDC_FORCE_UTF8|g' -i wccwin*.mak
  #update win16 makefile
  cat wccwin32.mak | sed 's|wcc386|wcc|g' | sed 's|win_nt|windows|g' > wccwin16.mak
  
  export PDCURSES_SRCDIR="$srcdir"
  
  rm -f *.obj
#missing strlen, strcpy, TCHAR, LPTSTR
# windows.h --> win16.h
#  msg "build for Win16..." 
#  export INCLUDE=$WATCOM/h:$WATCOM/h/win
#  wmake -f wccwin16.mak pdcurses.lib
#  mv pdcurses.lib curses.lib16
#  rm -f panel.lib
#  rm -f *.obj
  
  msg "build for Win32..."
  export INCLUDE=$WATCOM/h:$WATCOM/h/nt
  wmake -f wccwin32.mak pdcurses.lib
  rm -f panel.lib
  mv pdcurses.lib curses.lib32
  rm -f *.obj
  
  msg "build for DOS..."
  cd "$srcdir"/dos
  #hacking away dosisms from makefile
  sed 's|\/|-|g' -i wccdos*.mak
  sed 's|SRCDIR)\\|SRCDIR)\/|g' -i wccdos*.mak
  sed 's|-zq -wx|-zq -wx -fo=.obj|g' -i wccdos*.mak
  msg2 "16-bit ..."
  wmake -f wccdos16.mak pdcurses.lib
  mv pdcurses.lib curses.lib16
  rm -f panel.lib
  rm -f *.obj
  msg2 "32-bit (4GW) ..."
  wmake -f wccdos4g.mak pdcurses.lib
  mv pdcurses.lib curses.lib32
  rm -f panel.lib
  rm -f *.obj
  }

package() {
  cd "$srcdir"/win32a
  mkdir -p "${pkgdir}${WATCOM}"/{lib286/{dos,win},lib386/{dos,nt},h/{nt,win}}/
  chmod -R 755 "$pkgdir/opt"
  chmod 644 curses.lib*
  cp curses.lib32 "${pkgdir}${WATCOM}"/lib386/nt/pdcurses.lib
  cp "${pkgdir}${WATCOM}"/lib386/nt/pdcurses.lib "${pkgdir}${WATCOM}"/lib386/nt/panel.lib
#  cp curses.lib16 "${pkgdir}${WATCOM}"/lib286/win/pdcurses.lib
#  cp "${pkgdir}${WATCOM}"/lib286/win/pdcurses.lib "${pkgdir}${WATCOM}"/lib286/win/panel.lib
#  install -m644 "$srcdir"/*.h "${pkgdir}${WATCOM}"/h/win/
  install -m644 "$srcdir"/*.h "${pkgdir}${WATCOM}"/h/nt/
  
  cd "$srcdir"/dos
  install -m644 "$srcdir"/*.h "${pkgdir}${WATCOM}"/h/
  chmod 644 curses.lib*
  cp curses.lib16 "${pkgdir}${WATCOM}"/lib286/dos/pdcurses.lib
  cp "${pkgdir}${WATCOM}"/lib286/dos/pdcurses.lib "${pkgdir}${WATCOM}"/lib286/dos/panel.lib
  cp curses.lib32 "${pkgdir}${WATCOM}"/lib386/dos/pdcurses.lib
  cp "${pkgdir}${WATCOM}"/lib386/dos/pdcurses.lib "${pkgdir}${WATCOM}"/lib386/dos/panel.lib  
  
}

