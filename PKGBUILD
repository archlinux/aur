# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.8.1dev+10+ge4d8cda
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnm-gtk intltool python git)
install=networkmanager-openvpn.install
_commit=e4d8cda14483b3195dbf2a9d61c565f426108ea3  # master
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
