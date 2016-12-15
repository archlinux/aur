# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: TryA <tryagainprod at gmail dot com>
# Contributor: Jan de Groot <jgc at archlinux dot org>

pkgname=lib32-libnotify
pkgver=0.7.7
pkgrel=1
pkgdesc="Library for sending desktop notifications (32-bit)"
arch=('x86_64')
url="https://developer.gnome.org/notification-spec/"
license=('LGPL')
depends=("${pkgname#lib32-}" 'lib32-gdk-pixbuf2')
makedepends=('gcc-multilib' 'git' 'gnome-common' 'gobject-introspection' 'lib32-gtk3')
_commit=c954cabaad9e224c0c6129032d824012d332c11b  # tags/0.7.7^0
source=("git://git.gnome.org/libnotify#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd ${pkgname#lib32-}
  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd ${pkgname#lib32-}
  git describe --tags | sed 's/-/+/g'
}

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
#  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd ${pkgname#lib32-}
  ./configure --build=i686-pc-linux-gnu --prefix=/usr --disable-static --libdir=/usr/lib32
  make
}

package() {
  make -C "${pkgname#lib32-}" DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
