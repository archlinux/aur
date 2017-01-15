# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgname=dbus-x11
pkgver=1.10.14
pkgrel=1
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(i686 x86_64)
license=(GPL custom)
provides=('libdbus' 'dbus')
conflicts=('libdbus' 'dbus')
replaces=(libdbus)
depends=(libsystemd expat)
makedepends=(systemd xmlto docbook-xsl python yelp-tools doxygen git libx11)
_commit=449d6b313d2023360cf0af063cf23232901dd00b  # tags/dbus-1.10.14^0
source=("git+https://anongit.freedesktop.org/git/dbus/dbus#commit=$_commit"
        0001-Drop-Install-sections-from-user-services.patch)
sha256sums=('SKIP'
            '48135124680bd9ea2d7d2bd2a9f457608d97bd9aa7cb4f4396e26a1c2c91af3e')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

pkgver() {
  cd ${pkgname%-*}
  git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {
  cd ${pkgname%-*}
  patch -Np1 -i ../0001-Drop-Install-sections-from-user-services.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname%-*}
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
  cd ${pkgname%-*}
  make check
}

package() {
  cd ${pkgname%-*}

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/var/run"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-*}/COPYING"

  # Split docs
  mv "$pkgdir/usr/share/doc" "$srcdir"
}
