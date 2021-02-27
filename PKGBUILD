# Maintainer: Brian Turek <brian.turek@gmail.com>
# Contributor: Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn-git
pkgver=1.8.13.dev.r73.gf9918d2
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnma intltool python git)
optdepends=('libnma: GUI support')
conflicts=('networkmanager-openvpn')
provides=('networkmanager-openvpn')
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-openvpn.git")
sha256sums=('SKIP')

pkgver() {
  cd NetworkManager-openvpn
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd NetworkManager-openvpn
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
