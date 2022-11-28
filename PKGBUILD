# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn-xdg
pkgver=1.10.2
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN - with Support for the XDG Base Directory Specification"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnma intltool python git)
optdepends=('libnma: GUI support')
_commit=ae9575dd07cc2d2d51ec8d0297823e07017cb6e6
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-openvpn.git#commit=$_commit"
        "xdg-basedir.patch")
sha256sums=('SKIP'
            '25d1e22354f2ce30871654fa3bfebfe19dfe82432f0c4998ccd62b0c05727cba')
provides=('networkmanager-openvpn')
conflicts=('networkmanager-openvpn')

pkgver() {
  cd NetworkManager-openvpn
  git describe --tags | sed 's/-dev/dev/;s/-/+/g'
}

prepare() {
  cd NetworkManager-openvpn
  patch -Np1 -i ../xdg-basedir.patch
  intltoolize --automake --copy
  autoreconf -fvi
}

build() {
  cd NetworkManager-openvpn
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd NetworkManager-openvpn
  make DESTDIR="$pkgdir" install dbusservicedir=/usr/share/dbus-1/system.d
  echo 'u nm-openvpn - "NetworkManager OpenVPN"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set sw=2 et:
