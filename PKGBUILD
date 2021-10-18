# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=networkmanager-openconnect-useragent-git
pkgver=1.2.7dev+95+gee7776b
pkgrel=1
pkgdesc="NetworkManager VPN plugin for OpenConnect with support for custom useragent"
url="https://wiki.gnome.org/Projects/NetworkManager"
arch=(x86_64)
license=(GPL)
provides=(networkmanager-openconnect)
conflicts=(networkmanager-openconnect)
depends=(libnm libsecret openconnect libopenconnect.so)
makedepends=(libnma intltool python git)
optdepends=('libnma: GUI support')
source=("git+https://gitlab.gnome.org/patradebasish1987/NetworkManager-openconnect.git")
sha256sums=('SKIP')

pkgver() {
  cd NetworkManager-openconnect
  git describe --tags | sed 's/-dev/dev/;s/-/+/g'
}

prepare() {
  cd NetworkManager-openconnect
  intltoolize --automake --copy
  autoreconf -fvi
}

build() {
  cd NetworkManager-openconnect
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd NetworkManager-openconnect
  make DESTDIR="$pkgdir" install dbusservicedir=/usr/share/dbus-1/system.d
  echo 'u nm-openconnect - "NetworkManager OpenConnect"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
