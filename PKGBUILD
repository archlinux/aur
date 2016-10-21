# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgbase=dbus-selinux
pkgname=(dbus-selinux dbus-docs-selinux)
pkgver=1.10.12
pkgrel=1
pkgdesc="Freedesktop.org message bus system with SELinux support"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(i686 x86_64)
license=(GPL custom)
groups=('selinux')
depends=(libsystemd-selinux expat)
makedepends=(systemd-selinux xmlto docbook-xsl python yelp-tools doxygen audit libselinux)
source=(https://dbus.freedesktop.org/releases/${pkgbase/-selinux}/${pkgbase/-selinux}-$pkgver.tar.gz{,.asc}
        0001-Drop-Install-sections-from-user-services.patch)
sha256sums=('210a79430b276eafc6406c71705e9140d25b9956d18068df98a70156dc0e475d'
            'SKIP'
            '48135124680bd9ea2d7d2bd2a9f457608d97bd9aa7cb4f4396e26a1c2c91af3e')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

prepare() {
  cd ${pkgbase/-selinux}-$pkgver
  patch -Np1 -i ../0001-Drop-Install-sections-from-user-services.patch
  autoreconf -fvi
}

build() {
  cd ${pkgbase/-selinux}-$pkgver
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
  cd ${pkgbase/-selinux}-$pkgver
  make check
}

package_dbus-selinux() {
  provides=(libdbus libdbus-selinux "${pkgname/-selinux}=${pkgver}-${pkgrel}" "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=(libdbus libdbus-selinux "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  replaces=(libdbus libdbus-selinux)

  cd ${pkgbase/-selinux}-$pkgver

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
