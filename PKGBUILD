# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.8.1dev+9+gf9e2fd5
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(i686 x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnm-gtk intltool python git)
install=networkmanager-openvpn.install
_commit=f9e2fd5a58f16ad0cbc96e486f8c6c4feda34865  # master
source=("git+https://git.gnome.org/browse/network-manager-openvpn#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd network-manager-openvpn
  git describe --tags | sed 's/-dev/dev/;s/-/+/g'
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
