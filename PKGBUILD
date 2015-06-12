# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: Cravix

pkgname=jvgs
pkgver=0.5.1
pkgrel=1
pkgdesc="minimalistic platform game loosely based on xkcd webcomic"
arch=('i686' 'x86_64')
url="http://jvgs.sourceforge.net/"
license=('GPL' 'CCPL')
depends=('libgl' 'lua51' 'freetype2' 'sdl_mixer' 'mesa')
makedepends=('swig' 'cmake')
md5sums=('606ae3de9b7b5132f9b5813760cf8acd'
         'e39c4244e88342c9599a8135559d165c'
         '396a3fe5631603e08a60b5d9c6b3cff7')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver%.*}/${pkgname}-${pkgver}-src.tar.gz" "jvgs.desktop" "jvgs.png")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  cmake .
  sed -i 's%LUA_INCLUDE_DIR:PATH=/usr/include%LUA_INCLUDE_DIR:PATH=/usr/include/lua5.1%' CMakeCache.txt
  make
}

package() {
  mkdir -p ${pkgdir}/usr/{share/jvgs/resources,bin}
  install -D -m644 $srcdir/jvgs.png $pkgdir/usr/share/pixmaps/jvgs.png && \
  install -D -m644 $srcdir/jvgs.desktop $pkgdir/usr/share/applications/jvgs.desktop
  cd ${srcdir}/${pkgname}-${pkgver}-src
  install -D -m644 ./main.lua ${pkgdir}/usr/share/jvgs/main.lua
  install -D -m755 ./src/jvgs ${pkgdir}/usr/share/jvgs/jvgs
  cd resources
  tar cf - * | ( cd ${pkgdir}/usr/share/jvgs/resources; tar xfp -)
  (echo "#!/bin/bash
cd /usr/share/jvgs
./jvgs \"\$@\"") > $pkgdir/usr/bin/jvgs
  chmod 755 $pkgdir/usr/bin/jvgs
}
