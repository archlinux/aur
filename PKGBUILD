#Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=libqb-git
_pkgname=libqb
pkgver=1.9.0.r7.g99671f4
pkgrel=1
pkgdesc='Library with the primary purpose of providing high performance client server reusable features'
arch=('i686' 'x86_64')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('glibc')
makedepends=('git' 'doxygen' 'splint')
license=('LGPL2.1')
url="https://github.com/ClusterLabs/${_pkgname}"
source=("${pkgname}::git+https://github.com/ClusterLabs/libqb.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  echo "$pkgver"|sed 's,\.r,.,;s,\.g.*,,' >.tarball-version
  mkdir -p m4
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure \
    --prefix=/usr \
    --disable-fatal-warnings \
    --disable-static \
    --libdir=/usr/lib \
    --sbindir=/usr/bin
  make V=0
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim: set et sw=2:
