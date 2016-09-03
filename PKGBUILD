# $Id: PKGBUILD 274760 2016-08-28 01:55:59Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgbase=dbus
pkgname=dbus-x11
pkgver=1.10.10
pkgrel=3
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(i686 x86_64)
license=(GPL custom)
depends=(libsystemd expat dbus-docs)
makedepends=(systemd xmlto docbook-xsl python yelp-tools doxygen)
source=(https://dbus.freedesktop.org/releases/$pkgbase/$pkgbase-$pkgver.tar.gz{,.asc}
        0001-Drop-Install-sections-from-user-services.patch)
sha256sums=('9d8f1d069ab4d1a0255d7b400ea3bcef4430c42e729b1012abb2890e3f739a43'
            'SKIP'
            '48135124680bd9ea2d7d2bd2a9f457608d97bd9aa7cb4f4396e26a1c2c91af3e')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

prepare() {
  cd $pkgbase-$pkgver
  patch -Np1 -i ../0001-Drop-Install-sections-from-user-services.patch
  autoreconf -fvi
}

build() {
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=dbus \
      --with-system-pid-file=/run/dbus/pid \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-console-auth-dir=/run/console/ \
      --enable-inotify --disable-static \
      --disable-verbose-mode --disable-asserts \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --enable-systemd --enable-user-session \
      --enable-x11-autolaunch
  make
}

check() {
  cd $pkgbase-$pkgver
  make check
}

package() {
  provides=(libdbus)
  conflicts=(libdbus)
  replaces=(libdbus)

  cd $pkgbase-$pkgver

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/var/run"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgbase/COPYING"

  # Split docs
  rm -r "$pkgdir/usr/share/doc"
}
