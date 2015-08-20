# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=ow-curses-win32a
pkgdesc="An extended PDCurses directly on Win32 api (watcom-win32)"
groups=('watcom-win32' 'watcom-win16')
pkgver=14.03 #date of last release year.month
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
md5sums=('bfe45ee4f766bd74e9dbfc99dd1ce1af')

build() {
  cd "$srcdir"/win32a
  source /opt/watcom/owsetenv.sh
  
  #hacking away windowsisms from the makefile...
  sed 's|SRCDIR)\\|SRCDIR)\/|g' -i "$srcdir"/watcom.mif
  cp "$srcdir"/*.h "$srcdir"/pdcurses/
  sed 's|SRCDIR)\\|SRCDIR)\/|g' -i wccwin*.mak
  sed 's|copy |cp |g' -i wccwin*.mak
  sed 's|\/ei \/zq \/wx \/i=|-ei -zq -wx -fo=.obj -i=|g' -i wccwin*.mak
  sed 's|\/oneatx|-oneatx|g' -i wccwin*.mak
  sed 's|wlib \/q \/n \/t|wlib -q -n -t|g' -i wccwin*.mak
  #sed 's|-oneatx|-oneatx -aa -D__wargv=NULL|g' -i wccwin16.mak 
  sed 's|-oneatx|-oneatx -aa -D__wargv=NULL|g' -i wccwin32.mak #not present in win headers
  #sed 's|\/DPDC_WIDE|-DPDC_WIDE|g' -i wccwin*.mak
  #sed 's|\/DPDC_FORCE_UTF8|-DPDC_FORCE_UTF8|g' -i wccwin*.mak
    
  #msg "build for Win16..." 
  #export INCLUDE=$WATCOM/h:$WATCOM/h/win
  #wmake -f wccwin16.mak pdcurses.lib
  #mv pdcurses.lib curses.lib16
  #rm -f panel.lib
  
  msg "build for Win32..."
  export INCLUDE=$WATCOM/h:$WATCOM/h/nt
  wmake -f wccwin32.mak pdcurses.lib
  rm -f panel.lib
 }

package() {
  cd "$srcdir/win32a"
  #mkdir -p ${pkgdir}${WATCOM}/{lib286/win,lib386/nt,h/{nt,win}}/
  mkdir -p "${pkgdir}${WATCOM}/{lib386,h}/nt"
  chmod -R 755 "$pkgdir/opt"
  cp pdcurses.lib "${pkgdir}${WATCOM}"/lib386/nt/
  cp pdcurses.lib "${pkgdir}${WATCOM}"/lib386/nt/panel.lib
  chmod 644 "${pkgdir}${WATCOM}"/lib386/nt/{pdcurses,panel}.lib
  #install -m644 curses.lib16 ${pkgdir}${WATCOM}/lib286/win/{pdcurses,panel}.lib
  #install -m644 $srcdir/*.h ${pkgdir}${WATCOM}/h/{nt,win}/
  install -m644 "$srcdir"/*.h "${pkgdir}${WATCOM}"/h/nt/
}

