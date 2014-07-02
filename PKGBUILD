# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Giuseppe Calà, Jan Alexander Steffens, Alexander Rødseth, Jon Nordby

pkgname=lib32-libwebp
pkgver=0.4.0
pkgrel=1
pkgdesc="WebP library (32 bit)"
arch=('x86_64')
url="https://developers.google.com/speed/webp/"
license=('BSD')
depends=("${pkgname#*-}=$pkgver" 'lib32-glibc')
makedepends=('gcc-multilib')
source=("http://webp.googlecode.com/files/${pkgname#*-}-$pkgver.tar.gz")
sha256sums=('31913577e96386556855b41d210736449445fe96cfbe9289014e9b8afa944d69')

build() {
  cd ${pkgname#*-}-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static \
    --enable-swap-16bit-csp --enable-experimental \
    --enable-libwebpmux --enable-libwebpdemux --enable-libwebpdecoder
  make -C src # only build libraries
}

package() {
  make -C ${pkgname#*-}-$pkgver/src DESTDIR="$pkgdir/" install

  # remove headers
  rm -rf "$pkgdir"/usr/include

  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s ${pkgname#*-} "$pkgdir"/usr/share/licenses/$pkgname
}
