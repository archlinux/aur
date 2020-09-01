# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Janax <janax99@yahoo.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lib32-pam
pkgver=1.4.0
pkgrel=1
pkgdesc='Pluggable Authentication Modules'
arch=(x86_64)
url=http://linux-pam.org
license=(GPL2)
depends=(
  lib32-libnsl
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
_tag=5655b9d7bbf545d02f849888a0ff3a97a0ab6a20
source=(git+https://github.com/linux-pam/linux-pam.git?signed#tag=${_tag})
validpgpkeys=(296D6F29A020808E8717A8842DB5BD89A340AEB7) # Dimitry V. Levin <ldv@altlinux.org>
b2sums=(SKIP)
options=(!emptydirs)

pkgver() {
  cd linux-pam

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd linux-pam

  git cherry-pick -n 395915dae1571e10e2766c999974de864655ea3a
  git cherry-pick -n af0faf666c5008e54dfe43684f210e3581ff1bca
  git cherry-pick -n 0e9b286afe1224b91ff00936058b084ad4b776e4

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
