# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=hedgewars-hg
pkgver=r14415+.06672690d71b+
pkgrel=1
pkgdesc="Free Worms-like turn based strategy game (development version - mercurial)"
arch=('i686' 'x86_64')
url="http://hedgewars.org"
license=('GPL' 'custom')
depends=('qt5-base' 'sdl2' 'sdl2_mixer' 'sdl2_image' 'sdl2_net' 'sdl2_ttf' 'lua51' 'ffmpeg' 'glut'
         'physfs' 'ghc-libs' 'haskell-entropy' 'haskell-sha' 'haskell-random' 'haskell-regex-tdfa'
         'haskell-sandi' 'haskell-hslogger' 'haskell-utf8-string' 'haskell-vector')
makedepends=('fpc' 'cmake' 'qt5-tools' 'ghc' 'haskell-network' 'haskell-bytestring-show'
             'haskell-zlib' 'haskell-base-prelude' 'imagemagick' 'mesa')
source=("${pkgname}"::'hg+https://hg.hedgewars.org/hedgewars' \
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
  sed -i 's|set(ghc_flags|set(ghc_flags -dynamic|' gameServer/CMakeLists.txt
}

build() {
  cd ${srcdir}/${pkgname}
  mkdir -p $srcdir/bin
  cmake \
	-DCMAKE_BUILD_TYPE="Release" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DDATA_INSTALL_DIR=/usr/share/hedgewars \
	-DNOSERVER=0 .
  make

  # resize icon
  for _size in 16 32 48 64 128 256; do
    convert +set date:create +set date:modify misc/hedgewars.png -resize ${_size}x${_size} hedgewars_${_size}.png
  done
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=$pkgdir install
  install -D -m644 Fonts_LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/Fonts_LICENSE.txt
  install -D -m644 $srcdir/hedgewars.desktop $pkgdir/usr/share/applications/hedgewars.desktop

  # install icons
  install -D -m644 misc/hedgewars.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/hedgewars.png
  for _size in 16 32 48 64 128 256; do
    install -D -m644 hedgewars_${_size}.png "$pkgdir"/usr/share/icons/hicolor/${_size}x${_size}/apps/hedgewars.png
  done
  rm -rf "$pkgdir"/usr/share/pixmaps
}
