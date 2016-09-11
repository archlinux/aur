# Maintainer: Chris Cromer <chris@cromer.cl>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgname=dbus-x11-nosystemd
_pkgname=dbus
pkgver=1.10.10
pkgrel=4
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(i686 x86_64)
license=(GPL custom)
provides=('libdbus' 'dbus')
conflicts=('libdbus' 'dbus')
replaces=(libdbus)
depends=(expat)
makedepends=(xmlto docbook-xsl python yelp-tools doxygen xorg-server-common)
source=(https://dbus.freedesktop.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('9d8f1d069ab4d1a0255d7b400ea3bcef4430c42e729b1012abb2890e3f739a43'
            'SKIP')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

prepare() {
  cd $_pkgname-$pkgver
  autoreconf -fvi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=dbus \
      --with-system-pid-file=/run/dbus/pid \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-console-auth-dir=/run/console/ \
      --enable-inotify --disable-static \
      --disable-verbose-mode --disable-asserts \
      --enable-user-session \
      --disable-systemd \
      --enable-x11-autolaunch
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/var/run"

  # git rid of the systemd folder
  rm -r "$pkgdir/usr/lib/systemd"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"

  # Split docs
  rm -r "$pkgdir/usr/share/doc"
}
