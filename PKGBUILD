# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-libteam
pkgver=1.30
pkgrel=1
pkgdesc='Library for controlling team network device'
arch=(x86_64)
url=http://libteam.org/
license=(LGPL2.1)
depends=(
  lib32-dbus
  lib32-libnl
  lib32-zeromq
  libteam
)
makedepends=(
  git
  lib32-jansson
  lib32-libdaemon
  swig
)
source=(git+https://github.com/jpirko/libteam.git#tag=471fb50d206e5a3f2eef9e4247329b51edc5c493)
sha256sums=(SKIP)

pkgver() {
  cd libteam

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd libteam

  ./autogen.sh
}

build() {
  cd libteam

  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib32 \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --disable-static
    make
}

package() {
  make DESTDIR="${pkgdir}" -C libteam install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}

# vim: ts=2 sw=2 et:
