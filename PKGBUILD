# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=0.113+29+g3272a98
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges (32-bit)"
arch=(x86_64)
license=(LGPL)
url="https://www.freedesktop.org/wiki/Software/polkit/"
depends=(lib32-glib2 lib32-pam lib32-expat lib32-systemd polkit)
makedepends=(intltool gtk-doc gobject-introspection git autoconf-archive gcc-multilib)
_commit=3272a988655c3236b55bad70e9a3af20857f384b  # master
source=("git+https://anongit.freedesktop.org/git/polkit#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd polkit
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd polkit
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd polkit

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib32 \
      --localstatedir=/var --libexecdir=/usr/lib32/polkit-1 \
      --enable-libsystemd-login=yes --disable-static \
      --with-os-type=redhat

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make -C src/polkit polkitenumtypes.h
  make -C src/polkit libpolkit-gobject-1.la
  make -C src/polkitagent polkitagentenumtypes.h marshal.stamp
  make -C src/polkitagent libpolkit-agent-1.la
}

package() {
  cd polkit
  make -C src/polkit DESTDIR="$pkgdir" \
    lib_LTLIBRARIES="libpolkit-gobject-1.la" install-libLTLIBRARIES
  make -C src/polkitagent DESTDIR="$pkgdir" \
    lib_LTLIBRARIES="libpolkit-agent-1.la" install-libLTLIBRARIES
  make -C data DESTDIR="$pkgdir" install-pkgconfigDATA
}

# vim: ts=2 sw=2 et:
