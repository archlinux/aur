# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=sdl-ball
pkgver=1.02
pkgrel=2
pkgdesc="A Breakout clone with pretty graphics"
arch=('i686' 'x86_64')
url="http://sdl-ball.sourceforge.net/"
license=('GPL3')
#uncomment following line for wiimote support. Unable to get libbtctl to build at this time.
#depends=('libgl' 'wiiuse' 'sdl_mixer' 'sdl_ttf' 'sdl_image' 'mesa' 'gimp>=2' 'libbtctl')
#comment line below if compiling for wiimote support.
depends=('libgl' 'sdl_mixer' 'sdl_ttf' 'sdl_image' 'mesa')
makedepends=('gimp>=2')
source=(${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2/download
        ${pkgname}.desktop)
md5sums=('be7f662206b8bc02e07370826c7fb730'
         'eb9fb4483bd01020c8aba0db74c6cbff')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  #uncomment following 2 lines for wiimote support.

  #export LIBS="-lwiiuse"
  #export CFLAGS="${CXXFLAGS} -DWITH_WIIUSE"

  make clean
  make DATADIR="/usr/share/$pkgname/themes/"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "${pkgdir}"/usr/{bin,share/{${pkgname},applications,pixmaps}}
  install -m755 ${pkgname} "${pkgdir}"/usr/bin/
  cp -rf README themes/ "${pkgdir}"/usr/share/${pkgname}
  install -m644 themes/default/icon32.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
  install -m644 ../${pkgname}.desktop "${pkgdir}"/usr/share/applications/

  cd leveleditor/gimp-leveleditor
  gimptool-2.0 --build gimp-sdlball.c
  install -Dm755 gimp-sdlball "${pkgdir}"/usr/lib/gimp/2.0/plug-ins/gimp-sdlball
}
