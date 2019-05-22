# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dbus-git
pkgver=1.13.10.r2.gedece027
pkgrel=1
pkgdesc="Message bus system"
arch=('i686' 'x86_64')
url="https://www.freedesktop.org/wiki/Software/dbus/"
license=('GPL' 'custom')
depends=('glibc' 'audit' 'expat' 'systemd-libs')
makedepends=('git' 'autoconf-archive' 'systemd')
provides=('libdbus' 'dbus')
conflicts=('libdbus' 'dbus')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git")
sha256sums=('SKIP')


pkgver() {
  cd "dbus"

  git describe --long --tags | sed 's/^dbus-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "dbus"

  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix="/usr" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --libexecdir="/usr/lib/dbus-1.0" \
    --with-system-pid-file="/run/dbus/pid" \
    --with-system-socket="/run/dbus/system_bus_socket" \
    --with-console-auth-dir="/run/console" \
    --with-systemdsystemunitdir="/usr/lib/systemd/system" \
    --with-dbus-user="dbus" \
    --enable-systemd \
    --enable-user-session \
    --enable-epoll
  make
}

check() {
  cd "dbus"

  make check
}

package() {
  cd "dbus"

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/share/doc"
  rm -r "$pkgdir/var/run"

  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/dbus"

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"
}
