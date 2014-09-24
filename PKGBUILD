# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
pkgbase=dbus-selinux
pkgname=('dbus-selinux' 'libdbus-selinux')
pkgver=1.8.8
pkgrel=1
pkgdesc="Freedesktop.org message bus system with SELinux support"
url="http://www.freedesktop.org/Software/dbus"
arch=(i686 x86_64)
license=('GPL' 'custom')
groups=('selinux')
makedepends=('libx11' 'systemd-selinux' 'xmlto' 'docbook-xsl' 'audit')
source=(http://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.gz{,.asc}
        30-dbus)
md5sums=('b9f4a18ee3faa1e07c04aa1d83239c43'
         'SKIP'
         '3314d727fa57fc443fce25b5cbeebbcc')

build() {
  cd dbus-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=dbus \
      --with-system-pid-file=/run/dbus/pid \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-console-auth-dir=/run/console/ \
      --enable-inotify --disable-dnotify \
      --disable-verbose-mode --disable-static \
      --disable-tests --disable-asserts \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --enable-systemd \
      --enable-selinux --enable-libaudit
  make
}

package_dbus-selinux(){
  depends=('libdbus' 'expat' 'audit' 'libselinux' 'libsystemd-selinux')
  optdepends=('libx11: dbus-launch support')
  provides=('dbus-core' "${pkgname/-selinux}=${pkgver}-${pkgrel}" "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=('dbus-core' "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
  replaces=('dbus-core' "${pkgname/-selinux}")

  cd dbus-$pkgver

  # Disable installation of libdbus
  sed -i -e 's/^SUBDIRS = dbus/SUBDIRS =/' Makefile

  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}/var/run"
  rm -rf "${pkgdir}/usr/lib/pkgconfig"

  install -Dm755 ../30-dbus "$pkgdir/etc/X11/xinit/xinitrc.d/30-dbus"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/dbus-selinux/COPYING"
}

package_libdbus-selinux(){
  pkgdesc="DBus library"
  depends=('glibc')
  provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}")
  conflicts=("${pkgname/-selinux}")
  replaces=("${pkgname/-selinux}")

  cd dbus-$pkgver
  make DESTDIR="$pkgdir" -C dbus install
  make DESTDIR="$pkgdir" install-data-am
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/libdbus-selinux/COPYING"
}
