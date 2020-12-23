# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Janax <janax99@yahoo.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=lib32-pam-minimal-git
pkgver=1.5.1
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
makedepends=(git)
source=(git+https://github.com/linux-pam/linux-pam.git)
provides=(lib32-pam)
conflicts=(lib32-pam)
b2sums=(SKIP)
options=(!emptydirs)

pkgver() {
    cd linux-pam
    git describe --tags | sed 's/-/+/g'
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

  ./configure --prefix=/usr --libdir=/usr/lib32 --sbindir=/usr/bin --disable-db --disable-doc --disable-debug --without-mailspool --disable-audit --disable-selinux --disable-regenerate-docu
  make
}

package() {
  make DESTDIR="${pkgdir}" SCONFIGDIR=/etc/security -C linux-pam install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,lib,share}}
}

# vim: ts=2 sw=2 et:
