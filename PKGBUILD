# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dbus-git
pkgver=1.15.8.r17.gd9756df2
pkgrel=1
pkgdesc="Message bus system"
arch=('i686' 'x86_64')
url="https://www.freedesktop.org/wiki/Software/dbus/"
license=('GPL' 'custom')
depends=('glibc' 'audit' 'expat' 'libaudit.so' 'libsystemd.so' 'systemd-libs')
makedepends=('git' 'meson' 'systemd')
provides=("dbus=$pkgver" 'libdbus' 'libdbus-1.so')
conflicts=('dbus' 'libdbus')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git"
        "dbus-reload.hook::https://gitlab.archlinux.org/archlinux/packaging/packages/dbus/-/raw/main/dbus-reload.hook")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "dbus"

  git describe --long --tags | sed 's/^dbus-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "dbus"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --libexecdir="/usr/lib/dbus-1.0" \
    -Ddefault_library="both" \
    -Dsystem_pid_file="/run/dbus/pid" \
    -Dsystem_socket="/run/dbus/system_bus_socket" \
    -Ddbus_user="dbus" \
    -Depoll="enabled" \
    -Dsystemd="enabled" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "dbus"

  #meson test -C "_build"
}

package() {
  cd "dbus"

  meson install -C "_build" --destdir "$pkgdir"

  rm -r "$pkgdir"/{etc,usr/share/doc,run,var}

  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/dbus"

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  install -Dm644 "$srcdir/dbus-reload.hook" -t "$pkgdir/usr/share/libalpm/hooks"
}
