# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=hedgewars-hg
pkgver=r10991.fd172f166de4
pkgrel=1
pkgdesc="Free Worms-like turn based strategy game (development version - mercurial)"
arch=('i686' 'x86_64')
url="http://hedgewars.org"
license=('GPL' 'custom')
depends=('qt4' 'sdl_mixer' 'sdl_image' 'sdl_net' 'sdl_ttf' 'lua51' 'physfs' 'ffmpeg')
makedepends=('fpc' 'cmake' 'mercurial'
'ghc'
'haskell-network'
'haskell-bytestring-show'
'haskell-utf8-string'
'haskell-dataenc'
'haskell-hslogger'
'haskell-vector'
'haskell-entropy'
'haskell-sha'
'haskell-zlib'
'haskell-random')
source=("${pkgname}"::'hg+https://hedgewars.googlecode.com/hg/' \
	hedgewars.desktop \
        hedgewars.png)
md5sums=('SKIP'
         '48c66a3204d4fa0a69e9aa46f7c31e0c'
         'eeb14d50df39063549ac5eca9dbc65d1')
conflicts=('hedgewars')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd ${srcdir}/${pkgname}
  sed -i 's|instance NFData (Chan a)$|instance NFData (Chan a) where rnf x = seq x ()|' gameServer/CoreTypes.hs
}

build() {
  cd ${srcdir}/${pkgname}
  mkdir -p $srcdir/bin
  #cmake -DCMAKE_INSTALL_PREFIX=/usr -DDATA_INSTALL_DIR=/usr/share -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake -DQT_MOC_EXECUTABLE=/usr/bin/moc || return 1
  ln -sf /usr/bin/lrelease-qt4 $srcdir/bin/Qt4::lrelease
  export PATH=$srcdir/bin:$PATH
  cmake \
	-DCMAKE_BUILD_TYPE="Release" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DDATA_INSTALL_DIR=/usr/share/hedgewars \
	-DNOSERVER=0 .
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=$pkgdir install
  install -D -m644 Fonts_LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/Fonts_LICENSE.txt
  install -D -m644 $srcdir/hedgewars.png $pkgdir/usr/share/pixmaps/hedgewars.png
  install -D -m644 $srcdir/hedgewars.desktop $pkgdir/usr/share/applications/hedgewars.desktop
}
