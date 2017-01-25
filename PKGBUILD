# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.2.8
pkgrel=2
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(i686 x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnm-gtk intltool python git)
install=networkmanager-openvpn.install
_commit=3b19f480395aadf50de531d0a3df9bb8d924fe62  # tags/1.2.8^0
source=("git+https://git.gnome.org/browse/network-manager-openvpn#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd network-manager-openvpn
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd network-manager-openvpn
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd network-manager-openvpn
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/NetworkManager --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd network-manager-openvpn
  make DESTDIR="$pkgdir" install
}
