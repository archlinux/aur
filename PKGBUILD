# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Giuseppe Calà, Jan Alexander Steffens, Alexander Rødseth, Jon Nordby

pkgname=lib32-libwebp
pkgver=0.4.2
pkgrel=1
pkgdesc="WebP library (32 bit)"
arch=('x86_64')
url="https://developers.google.com/speed/webp/"
license=('BSD')
depends=("${pkgname#*-}=$pkgver" 'lib32-glibc')
makedepends=('gcc-multilib')
source=("http://downloads.webmproject.org/releases/webp/${pkgname#*-}-$pkgver.tar.gz"{,.asc})
sha256sums=('14d825d7c2ef7d49621bcb6b83466be455585e671ae0a2ebc1f2e07775a1722d'
            'SKIP')
validpgpkeys=("6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D") # WebP release signing key

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
