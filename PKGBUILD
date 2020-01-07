# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lib32-libwebp
pkgver=1.1.0
pkgrel=1
pkgdesc='WebP library'
arch=('x86_64')
url='https://developers.google.com/speed/webp/'
license=('BSD')
depends=('lib32-glibc' 'libwebp')
makedepends=('git')
_commit=d7844e9762b61c9638c263657bd49e1690184832  # tags/v1.1.0-rc2^0
source=("git+https://chromium.googlesource.com/webm/libwebp#commit=${_commit}")
sha256sums=('SKIP')
validpgpkeys=('6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D') # WebP release signing key

pkgver() {
  cd libwebp
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd libwebp

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libwebp

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static \
    --enable-swap-16bit-csp \
    --enable-experimental \
    --enable-libwebp{mux,demux,decoder,extras}
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd libwebp

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libwebp "${pkgdir}"/usr/share/licenses/lib32-libwebp
}

# vim: ts=2 sw=2 et:
