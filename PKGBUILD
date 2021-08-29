# Maintainer: Cooky.12 cooky.12@qq.com

pkgname=('bluez-plugins-fix')
pkgver=5.61
pkgrel=1
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL2')
makedepends=('dbus' 'libical' 'systemd' 'alsa-lib' 'json-c' 'ell' )
source=( https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz
         fake-ps3.patch 
)

# see https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
sha256sums=( '83afd6c52179554bfeabbcb538fec2eb6be90a8ac3c40871b49d7ad8b49c423b'
             '99c57b92b0c03778f5271dfae16cc6af381627cf2224a971889c9d3fb30336f4'
)

build() {
  cd bluez-${pkgver}
  patch --forward --strip=1 --input="${srcdir}/fake-ps3.patch"
  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --with-dbusconfdir=/usr/share \
          --disable-manpages \
          --disable-btpclient \
          --disable-midi \
          --enable-sixaxis \
          --disable-mesh \
          --disable-hid2hci \
          --disable-experimental \
          --disable-library # this is deprecated
  make
}

check() {
  cd bluez-$pkgver
  # tests segfault and hang
#  make check || /bin/true # https://bugzilla.kernel.org/show_bug.cgi?id=196621
}

package_bluez-plugins-fix() {
  pkgdesc="bluez plugins (PS3 Sixaxis controller)"
  depends=('systemd')
  conflicts=('bluez-plugins')

  cd bluez-${pkgver}
  make DESTDIR="${pkgdir}" \
       install-pluginLTLIBRARIES
}
