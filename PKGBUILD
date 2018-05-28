# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.8.4
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnm-gtk intltool python git)
_commit=06fdd06e74b17f90054b09b1623b675993fb2070  # tags/1.8.4^0
source=("git+https://gitlab.gnome.org/GNOME/network-manager-openvpn.git#commit=$_commit")
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
    --libexecdir=/usr/lib --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd network-manager-openvpn
  make DESTDIR="$pkgdir" install
  echo 'u nm-openvpn - "NetworkManager OpenVPN"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
