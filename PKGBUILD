# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=lib32-mpg123
pkgver=1.33.4
pkgrel=1
pkgdesc='Console based real time MPEG Audio Player for Layer 1, 2 and 3 (32-bit)'
url='https://mpg123.de/'
arch=('x86_64')
license=('LGPL-2.1-only')
depends=('lib32-alsa-lib' 'mpg123')
makedepends=('lib32-sdl2' 'lib32-jack2' 'lib32-libpulse')
optdepends=(
  'lib32-sdl2: for sdl audio support'
  'lib32-jack: for jack audio support'
  'lib32-libpulse: for pulse audio support'
)
provides=(lib{mpg,out,syn}123.so)
source=(https://downloads.sourceforge.net/sourceforge/mpg123/mpg123-${pkgver}.tar.bz2{,.sig})
sha512sums=('9b7aa93b692132da7eb8dcfef12ce91bf66bf8475af50e9c57d7b80225f96c0e74264e518e558371af1f4cf6d2afda5b3dfc844949fd747db7ac7c44d0e9f6ad'
            'SKIP')
validpgpkeys=('D021FF8ECF4BE09719D61A27231C4CBC60D5CAFE')

build() {
  cd mpg123-${pkgver}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  ./configure \
    --build="$CHOST" \
    --host=i686-pc-linux-gnu \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-int-quality \
    --with-audio="alsa oss sdl jack pulse"
  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd mpg123-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/{include,share,bin}
}

# vim:set sw=2 sts=-1 et:
