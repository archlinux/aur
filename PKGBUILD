#Maintainer: Brian Bidulock <bidulock@openss7.org>
#Contributor: Ian Beringer <ian@ianberinger.com>

pkgname=libqb-git
_pkgname=libqb
pkgver=2.0.4.r0.ga2691b9
pkgrel=1
pkgdesc='Library for providing high performance, reusable features for client-server architecture'
url="https://github.com/ClusterLabs/${_pkgname}"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('glibc')
makedepends=('git' 'doxygen' 'splint')
checkdepends=('check')
provides=('libqb.so' "${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/ClusterLabs/libqb.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  ./autogen.sh
}

check() {
  cd ${pkgname}
  make -C tests VERBOSE=1 check
}

build() {
  cd ${pkgname}
  ./configure \
    --prefix=/usr \
    --disable-fatal-warnings \
    --disable-static \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --localstatedir=/var
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make V=0
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
