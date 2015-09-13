# Contributor: Daenyth <Daenyth+arch [AT] gmail [dot] com>
pkgname=tremulous
pkgver=1.1.0
pkgrel=13
pkgdesc='Free team based FPS/RTS hybrid built on the ioq3 engine. Includes community updates'
url='http://tremulous.net'
arch=('x86_64' 'i686')
license=('GPL')
depends=('sdl' 'openal' 'libgl' "tremulous-data=$pkgver" "freetype2" 'glu')
makedepends=('git' 'mesa')
provides=("tremulous-updated=$pkgver-$pkgrel")
conflicts=('tremulous-updated')
replaces=('trem-backport' 'tremulous-updated')
source=(git://github.com/jkent/tremulous-mgclient.git
        git://github.com/jkent/tremulous-mgtremded.git
        game.qvm.bz2
        lakitu7_qvm.txt
        tremdedrc
        tremulous.desktop
        tremded.sh
        tremulous.sh
        tremulous.xpm)
backup=('etc/tremdedrc')

md5sums=('SKIP'
         'SKIP'
         'bbb59bd459fced70ab7e152c84c6fe1c'
         'a0b8970b33a27798c125f9152049013c'
         'f0056120d0192a0d4d591d1114439c52'
         'aef37632a2edcf74a53503a49530bad2'
         'c6db2ed86ce31380b233d88e26280643'
         '8fba8bee98f51fe2ebdd076b83e00bc3'
         '7e3a881608f1c7c0ccece1e07fcf92d8')
        
         
_arch=${CARCH/i686/x86}        

build() {
 
  sed -i "s/EXT_REPLACE/${_arch}/" "${srcdir}/tremulous.sh"
  sed -i "s/EXT_REPLACE/${_arch}/" "${srcdir}/tremded.sh"
  
  # Build the server
  cd "${srcdir}/tremulous-mgtremded"
  make release
  
  # Build the client
  cd "${srcdir}/tremulous-mgclient"
  sed -i '/CC=gcc-4.6/d' Makefile
  
  #version: without -LUA
  sed -i 's/M-LUA/M/' Makefile

  make USE_LUA=0 USE_FREETYPE=0

}

package() {
  cd "${srcdir}/tremulous-mgtremded"
  install -D -m755 build/release-linux-${_arch}/tremded.${_arch}  "${pkgdir}/opt/tremulous/tremded.${_arch}"
  install -D -m644 "${srcdir}/tremdedrc"                          "${pkgdir}/etc/tremdedrc"
  install -D -m644 "${srcdir}/game.qvm"                           "${pkgdir}/opt/tremulous/game.qvm"
  install -D -m755 "${srcdir}/tremded.sh"                         "${pkgdir}/usr/bin/tremded"

  cd "${srcdir}/tremulous-mgclient"
  install -Dm755 "build/release-linux-${_arch}/tremulous.${_arch}"  "${pkgdir}/opt/tremulous/tremulous.${_arch}"
  install -D -m755 "${srcdir}/tremulous.sh"               	        "${pkgdir}/usr/bin/tremulous"

  # Install the documentation
  install -Dm644 "${srcdir}/tremulous-mgclient/docs/mg-client-manual.txt" "$pkgdir/usr/share/tremulous/mg-client-manual.txt"
  install -Dm644 "${srcdir}/lakitu7_qvm.txt"     "$pkgdir/usr/share/tremulous/lakitu7_qvm.txt"

  # Install the .desktop and icon files
  install -D -m644 "${srcdir}/tremulous.xpm"     "${pkgdir}/usr/share/pixmaps/tremulous.xpm"
  install -D -m644 "${srcdir}/tremulous.desktop" "${pkgdir}/usr/share/applications/tremulous.desktop"
}
