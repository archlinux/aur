# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=0.118
pkgrel=1
pkgdesc='Application development toolkit for controlling system-wide privileges'
arch=(x86_64)
license=(LGPL)
url=https://www.freedesktop.org/wiki/Software/polkit/
depends=(
  lib32-expat
  lib32-glib2
  lib32-pam
  lib32-systemd
  polkit
)
makedepends=(
  autoconf-archive
  git
  gobject-introspection
  gtk-doc
  intltool
)
_tag=ff4c2144f0fb1325275887d9e254117fcd8a1b52
source=(git+https://gitlab.freedesktop.org/polkit/polkit/#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd polkit

  git describe --tags
}

prepare() {
  cd polkit

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd polkit

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib32 \
    --localstatedir=/var \
    --libexecdir=/usr/lib32 \
    --disable-gtk-doc \
    --disable-static \
    --enable-libsystemd-login=yes \
    --with-os-type='redhat'

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make -C src/polkit polkitenumtypes.h
  make -C src/polkit libpolkit-gobject-1.la
  make -C src/polkitagent polkitagentenumtypes.h marshal.stamp
  make -C src/polkitagent libpolkit-agent-1.la
}

package() {
  cd polkit

  make -C src/polkit DESTDIR="${pkgdir}" lib_LTLIBRARIES=libpolkit-gobject-1.la install-libLTLIBRARIES
  make -C src/polkitagent DESTDIR="${pkgdir}" lib_LTLIBRARIES=libpolkit-agent-1.la install-libLTLIBRARIES
  make -C data DESTDIR="${pkgdir}" install-pkgconfigDATA
}

# vim: ts=2 sw=2 et:
