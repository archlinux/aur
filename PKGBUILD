# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgbase=dbus-selinux
pkgname=(dbus-selinux dbus-docs-selinux)
pkgver=1.10.16
pkgrel=1
pkgdesc="Freedesktop.org message bus system with SELinux support"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(i686 x86_64)
license=(GPL custom)
groups=('selinux')
depends=(libsystemd-selinux expat)
makedepends=(systemd-selinux xmlto docbook-xsl python yelp-tools doxygen git audit libselinux)
_commit=8b582cb10d7cf00af7a70496aec48af24edc542b  # tags/dbus-1.10.16^0
source=("git+https://anongit.freedesktop.org/git/dbus/dbus#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

pkgver() {
  cd ${pkgbase/-selinux}
  git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {
  cd ${pkgbase/-selinux}
  git cherry-pick -n 09cb6d7b467f6d1c6685ee9ccc171f4dddbe1f42
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgbase/-selinux}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=dbus \
      --with-system-pid-file=/run/dbus/pid \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-console-auth-dir=/run/console/ \
      --enable-inotify --disable-static \
      --disable-verbose-mode --disable-asserts \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --enable-systemd --enable-user-session \
      --enable-selinux --enable-libaudit
  make
}

check() {
  cd ${pkgbase/-selinux}
  make check
}

package_dbus-selinux() {
  provides=(libdbus libdbus-selinux "${pkgname/-selinux}=${pkgver}-${pkgrel}" "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=(libdbus libdbus-selinux "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  replaces=(libdbus libdbus-selinux)

  cd ${pkgbase/-selinux}

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/var/run"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgbase/COPYING"

  # Split docs
  mv "$pkgdir/usr/share/doc" "$srcdir"
}

package_dbus-docs-selinux() {
  pkgdesc+=" (documentation)"
  depends=(dbus-selinux)

  install -d "$pkgdir/usr/share/licenses"
  ln -s dbus-selinux "$pkgdir/usr/share/licenses/dbus-docs-selinux"

  mv doc "$pkgdir/usr/share"
}
