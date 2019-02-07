# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openvpn
pkgver=1.8.9dev+16+g33c941d
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenVPN"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
depends=(libnm libsecret openvpn)
makedepends=(libnma intltool python git)
optdepends=('libnma: GUI support')
_commit=33c941d21002e279d4ac36a641c16a37d114c759  # master
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-openvpn.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd NetworkManager-openvpn
  git describe --tags | sed 's/-dev/dev/;s/-/+/g'
}

prepare() {
  cd NetworkManager-openvpn

  # Don't build against libnm-glib/gtk
  git cherry-pick -n b423aa8214b2ef6b97e419d0b0e3e5e68f4b2e5b

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
