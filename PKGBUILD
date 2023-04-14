# Maintainer: Michael Lowman <michael.d.lowman@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openconnect-git
pkgver=1.2.9dev+r109+g5a1cdff
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenConnect"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
conflicts=(networkmanager-openconnect)
provides=(networkmanager-openconnect)
depends=(libnm libsecret openconnect libopenconnect.so)
makedepends=(libnma libnma-gtk4 intltool python git)
optdepends=('libnma: GUI support (GTK 3)'
            'libnma-gtk4: GUI support (GTK 4)')
source=("git+https://gitlab.gnome.org/GNOME/NetworkManager-openconnect.git")
sha256sums=('SKIP')

pkgver() {
  cd NetworkManager-openconnect
  git describe --tags | sed 's/-dev/dev/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd NetworkManager-openconnect
  intltoolize --automake --copy
  autoreconf -fvi
}

build() {
  cd NetworkManager-openconnect
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static --with-gtk4
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd NetworkManager-openconnect
  make DESTDIR="$pkgdir" install dbusservicedir=/usr/share/dbus-1/system.d
  echo 'u nm-openconnect - "NetworkManager OpenConnect"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set sw=2 et:
