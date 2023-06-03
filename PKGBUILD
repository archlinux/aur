# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.10.2
pkgrel=2
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnma libnma-gtk4 python git)
optdepends=('libnma: GUI support (GTK 3)'
            'libnma-gtk4: GUI support (GTK 4)')
_commit=ae9575dd07cc2d2d51ec8d0297823e07017cb6e6  # tags/1.10.2^0
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-openvpn.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd NetworkManager-openvpn
  git describe --tags | sed 's/-dev/dev/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd NetworkManager-openvpn

  # Fix data-ciphers
  # https://gitlab.gnome.org/GNOME/NetworkManager-openvpn/-/issues/112
  git cherry-pick -n a790374f4c2e9e1657cbb8470357d72d4bd87916

  autoreconf -fvi
}

build() {
  cd NetworkManager-openvpn
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static --with-gtk4
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd NetworkManager-openvpn
  make DESTDIR="$pkgdir" install dbusservicedir=/usr/share/dbus-1/system.d
  echo 'u nm-openvpn - "NetworkManager OpenVPN"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set sw=2 sts=-1 et:
