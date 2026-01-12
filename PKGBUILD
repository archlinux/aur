# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from https://aur.archlinux.org/packages/dbus-git by 
# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
#DL!
pkgname=dbus-nosystemd-git
pkgver=1.16.0.r143.g4f5796a3
pkgrel=1
pkgdesc="Message bus system -- no systemd for you!"
arch=('i686' 'x86_64')
url="https://www.freedesktop.org/wiki/Software/dbus/"
license=('GPL' 'custom')
depends=('glibc' 'audit' 'expat' 'libaudit.so')
makedepends=('git' 'meson')
provides=("dbus=$pkgver" 'libdbus' 'libdbus-1.so')
conflicts=('dbus' 'libdbus')
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git")
sha256sums=('SKIP')


pkgver() {
  cd "dbus"

  git describe --long --tags | sed 's/^dbus-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "dbus"

  arch-meson \
    --libexecdir="/usr/lib/dbus-1.0" \
    -Ddefault_library="shared" \
    -Dsystem_pid_file="/run/dbus/pid" \
    -Dsystem_socket="/run/dbus/system_bus_socket" \
    -Ddbus_user="dbus" \
    -Depoll="enabled" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "dbus"

  meson test -C "_build"
}

package() {
  cd "dbus"

  meson install -C "_build" --destdir "$pkgdir"

  rm -r "$pkgdir"/{etc,usr/share/doc,run,var}

  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/dbus"

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"
}
