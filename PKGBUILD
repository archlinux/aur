# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Janax <janax99@yahoo.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lib32-pam
pkgver=1.5.2
pkgrel=1
pkgdesc='Pluggable Authentication Modules'
arch=(x86_64)
url=http://linux-pam.org
license=(GPL2)
depends=(
  lib32-libtirpc
  lib32-libxcrypt
  pam
)
makedepends=(
  docbook-xml
  docbook-xsl
  git
  lib32-flex
  w3m
)
_tag=v$pkgver
source=(git+https://github.com/linux-pam/linux-pam.git?signed#tag=${_tag})
validpgpkeys=(296D6F29A020808E8717A8842DB5BD89A340AEB7) # Dimitry V. Levin <ldv@altlinux.org>
b2sums=('SKIP')
options=(!emptydirs)

pkgver() {
  cd linux-pam

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd linux-pam
  ./autogen.sh
}

build() {
  cd linux-pam

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sbindir=/usr/bin \
    --disable-db
  make
}

package() {
  make DESTDIR="${pkgdir}" SCONFIGDIR=/etc/security -C linux-pam install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,lib,share}}
}

# vim: ts=2 sw=2 et:
