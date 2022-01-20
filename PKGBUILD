# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lib32-libwebp
pkgver=1.2.2
pkgrel=1
pkgdesc='WebP library'
arch=('x86_64')
url='https://developers.google.com/speed/webp/'
license=('BSD')
depends=('lib32-glibc' 'libwebp')
provides=(libwebp{,decoder,demux,mux}.so)
source=(https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-${pkgver}.tar.gz{,.asc})
sha256sums=('7656532f837af5f4cec3ff6bafe552c044dc39bf453587bd5b77450802f4aee6'
            'SKIP')
validpgpkeys=('6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D') # WebP release signing key

build() {
  cd libwebp-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static \
    --enable-swap-16bit-csp \
    --enable-libwebp{mux,demux,decoder,extras}
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libwebp-${pkgver}
  make check
}

package() {
  cd libwebp-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libwebp "${pkgdir}"/usr/share/licenses/lib32-libwebp
}

# vim: ts=2 sw=2 et:
