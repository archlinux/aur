# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgname=dbus-x11
pkgver=1.10.18
pkgrel=1
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(i686 x86_64)
license=(GPL custom)
provides=('libdbus' 'dbus' 'dbus-docs')
conflicts=('libdbus' 'dbus' 'dbus-docs')
replaces=(libdbus)
depends=(libsystemd expat)
makedepends=(systemd xmlto docbook-xsl python yelp-tools doxygen git libx11)
_commit=73961ee58cf47315b14e30fbde6d0eea825c987b  # tags/dbus-1.10.18^0
source=("git+https://anongit.freedesktop.org/git/dbus/dbus#commit=$_commit"
        'dbus.sysusers')
sha256sums=('SKIP'
            '1ce179ba3a92ad34941d8ac7f53d01d42cbc91d43ada1136492b78c10b5d693d')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

pkgver() {
  cd ${pkgname%-*}
  git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {
  cd ${pkgname%-*}
  git cherry-pick -n 09cb6d7b467f6d1c6685ee9ccc171f4dddbe1f42
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

  # systemd-sysusers
  install -Dm644 "$srcdir/dbus.sysusers" "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  # Split docs
  mv "$pkgdir/usr/share/doc" "$srcdir"

  install -d "$pkgdir/usr/share/licenses"
  ln -s dbus "$pkgdir/usr/share/licenses/dbus-docs"

  mv doc "$pkgdir/usr/share"
}
