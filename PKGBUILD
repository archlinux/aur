# Maintainer: Cooky-12 cooky-12@qq.com

pkgname=('bluez-plugins-ps3')
pkgver=5.72
pkgrel=1
url="http://www.bluez.org/"
arch=('x86_64')
license=('GPL2')
makedepends=('dbus' 'libical' 'alsa-lib' 'json-c' 'ell' 'systemd-libs') 
source=( https://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz
         fake-ps3.patch 
)

sha256sums=( '499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e'
             '2eb8953fa0491315af34eaa940c77f7373cbd18d7f67acc780f460f3edb64ffb'
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
}

package_bluez-plugins-ps3() {
  pkgdesc="bluez plugins ( add support for non shanwan fake ps3 controllers )"
  depends=('systemd-libs')
  conflicts=('bluez-plugins')

  cd bluez-${pkgver}
  make DESTDIR="${pkgdir}" \
       install-pluginLTLIBRARIES
}
