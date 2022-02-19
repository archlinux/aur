# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=libxcrypt-compat
pkgver=4.4.28
pkgrel=2
pkgdesc='Modern library for one-way hashing of passwords: legacy API functions'
arch=('x86_64')
url='https://github.com/besser82/libxcrypt/'
license=('GPL')
depends=('glibc' 'libxcrypt')
provides=('libcrypt.so.1')
options=(!emptydirs)
validpgpkeys=('678CE3FEE430311596DB8C16F52E98007594C21D') # Björn 'besser82' Esser
source=("${url}/releases/download/v${pkgver}/${pkgname%-compat}-${pkgver}.tar.xz"{,.asc})
sha256sums=('9e936811f9fad11dbca33ca19bd97c55c52eb3ca15901f27ade046cc79e69e87'
            'SKIP')

build() {
  cd ${pkgname%-compat}-${pkgver}
  # libxcrypt doesn't like nongenerick flags
  export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
          -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security \
          -fstack-clash-protection -fcf-protection"
  export CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
  export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=glibc \
    --disable-failure-tokens
  make
}

check() {
  cd ${pkgname%-compat}-${pkgver}
  make check 
}

package() {
  cd ${pkgname%-compat}-${pkgver}
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/include/crypt.h"
  rm "$pkgdir/usr/lib/libcrypt.so"
  rm "$pkgdir/usr/lib/libxcrypt.so"
  rm -r "$pkgdir/usr/lib/pkgconfig"
  rm -r "$pkgdir/usr/share/man"
}
