# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=lib32-libprocps
_name=${pkgname//lib32-/}
pkgver=3.3.17
pkgrel=1
pkgdesc='procps 3.x libraries for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
arch=(x86_64)
depends=(
  lib32-glibc
  lib32-systemd
)
makedepends=(
  git
  lib32-gcc-libs
)
provides=(libprocps.so)
source=($_name::git+$url.git#tag=v$pkgver)
sha512sums=('948bada236458aa5751cc5f3e049e00af1e08d0f754b95574e56b4b5bf6a1086e3fce299a361cc53030e887ab30fb74fbffaaf1128308de192936718411adebe')
b2sums=('1141866a24a2ad0d96a1f2ea96f3f9a14be967134d2676195c44d1c1abcdb58fda2fbb44fc53c1145f606e6d6f03192542017c4742ec00849ffe09d0cb2cb02f')
validpgpkeys=(5D2FB320B825D93904D205193938F96BDF50FEA5)  # Craig Small <csmall@debian.org>

prepare() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_name
  ./autogen.sh
}

build() {
  local configure_options=(
    --bindir=/usr/bin
    --disable-pidof
    --disable-kill
    --disable-modern-top
    --exec-prefix=/
    --libdir=/usr/lib32
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-systemd
    --without-ncurses
  )

  cd $_name
  ./configure "${configure_options[@]}"
  # NOTE: french translation generation is broken and we don't need it anyway
  sed 's/fr.gmo//g' -i po/Makefile
  make
}

package() {
  make DESTDIR="$pkgdir" install -C $_name
  # remove files that we do not need
  rm -rf "$pkgdir"/usr/{bin,include,share}
}
