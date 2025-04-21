# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-dbus-glib
pkgver=0.114
pkgrel=1
pkgdesc='GLib bindings for DBUS'
arch=(x86_64)
license=(GPL)
url=https://www.freedesktop.org/wiki/Software/DBusBindings
depends=(
  dbus-glib
  lib32-glib2
  lib32-glibc
  lib32-dbus
)
makedepends=(
  git
  glib2-devel
  gtk-doc
  lib32-expat
  python
)
_tag=623a4f3386a675060335e20afd810c6e10ae2cc8
source=(git+https://gitlab.freedesktop.org/dbus/dbus-glib.git#tag=${_tag})
validpgpkeys=(DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90) # Simon McVittie <smcv@collabora.com>
b2sums=('54a1ac02b863520fbda6d23d30fcce19c1adb9b55ea46afc399c6d4ef8660766fd39e804be56e5010b5d1fa7a24131a247ef3bbcd8d49cf3a8373c28b9d77e7c')

prepare() {
  cd dbus-glib
  ./autogen.sh \
    --no-configure
}

pkgver() {
  cd dbus-glib
  git describe --tags | sed 's/dbus-glib-//'
}

build() {
  cd dbus-glib

  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --disable-bash-completion \
    --disable-checks \
    --disable-gtk-doc \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" install -C dbus-glib
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
