# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.8.2
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnm-gtk intltool python git)
_commit=2e270c959dbcf74fb015a045170c273d23ed1d75  # tags/1.8.2^0
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
