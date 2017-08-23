# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dbus-git
pkgver=1.11.16.r31.gd82378fd
pkgrel=1
pkgdesc="Message bus system"
arch=('i686' 'x86_64')
url="https://wiki.freedesktop.org/www/Software/dbus/"
license=('GPL' 'custom')
depends=('glibc' 'expat' 'gettext' 'libsystemd')
makedepends=('git' 'autoconf-archive' 'systemd')
provides=('libdbus' 'dbus')
conflicts=('libdbus' 'dbus')
options=('staticlibs')
source=("git+https://anongit.freedesktop.org/git/dbus/dbus.git"
        "dbus.sysusers::https://git.archlinux.org/svntogit/packages.git/plain/trunk/dbus.sysusers?h=packages/dbus")
sha256sums=('SKIP'
            'SKIP')


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
    --with-dbus-user=dbus --enable-systemd --enable-user-session --enable-epoll
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

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/dbus/COPYING"

  install -Dm644 "$srcdir/dbus.sysusers" "$pkgdir/usr/lib/sysusers.d/dbus.conf"
}
