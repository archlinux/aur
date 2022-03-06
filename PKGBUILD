# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@gulli.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Tom Killian <tomk@runbox.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=lib32-libnewt
pkgver=0.52.21
pkgrel=2
pkgdesc="Not Erik's Windowing Toolkit - text mode windowing with slang"
arch=(x86_64)
url=https://fedorahosted.org/newt/
license=(GPL)
depends=(
  lib32-glibc
  lib32-gpm
  lib32-popt
  lib32-slang
  libnewt
)
makedepends=(
  git
  lib32-tcl
)
optdepends=('lib32-tcl: whiptcl support')
options=(!makeflags)
source=(git+https://pagure.io/newt.git#tag=r${pkgver//./-})
sha256sums=(SKIP)

prepare() {
  cd newt

  sed -i 's/tcl8.4/tcl8.6/' Makefile.in
  echo '#define USE_INTERP_RESULT 1' >> config.h

  autoreconf -fiv
}

build() {
  cd newt

  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-gpm-support \
    --without-python
  make
}

package() {
  cd newt

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
