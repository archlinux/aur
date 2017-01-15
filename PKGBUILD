# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lib32-libwebp
pkgver=0.5.2
pkgrel=1
pkgdesc='WebP library'
arch=('x86_64')
url='https://developers.google.com/speed/webp/'
license=('BSD')
depends=('lib32-glibc' 'libwebp')
makedepends=('gcc-multilib')
source=("https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-${pkgver}.tar.gz"{,.asc})
sha256sums=('b75310c810b3eda222c77f6d6c26b061240e3d9060095de44b2c1bae291ecdef'
            'SKIP')
validpgpkeys=('6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D') # WebP release signing key

build() {
  cd libwebp-$pkgver

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
  make
}

package() {
  cd libwebp-$pkgver

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libwebp "${pkgdir}"/usr/share/licenses/lib32-libwebp
}

# vim: ts=2 sw=2 et:
