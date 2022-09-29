# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Andrey Vetrov <vetrov at mail dot ru>
# Based on the file created for Arch Linux by:
# Jan de Groot <jgc@archlinux.org>
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=dbus-x11
pkgname=(dbus-x11 dbus-x11-docs)
pkgver=1.15.0
_commit="2770215f6cc31cf4723c71cfc67d2a505225d659"  # must be changed at every version update, found at https://gitlab.freedesktop.org/dbus/dbus/-/tags
pkgrel=2
pkgdesc="Freedesktop.org message bus system (with x11 autolaunch)"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=(GPL custom)
depends=(systemd-libs expat audit)
makedepends=(systemd xmlto docbook-xsl python yelp-tools doxygen git autoconf-archive libx11)
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git#commit=$_commit"
        "dbus-reload.hook")
sha256sums=('SKIP'
            'd636205622d0ee3b0734360225739ef0c7ad2468a09489e6ef773d88252960f3')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>
pkgver() {
  cd dbus
  git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {
  cd dbus
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd dbus
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/dbus-1.0 \
    runstatedir=/run \
    --with-console-auth-dir=/run/console/ \
    --with-dbus-user=dbus \
    --with-system-pid-file=/run/dbus/pid \
    --with-system-socket=/run/dbus/system_bus_socket \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-inotify \
    --enable-systemd \
    --enable-user-session \
    --disable-static \
    --disable-verbose-mode \
    --disable-asserts \
    --disable-checks \
    --enable-x11-autolaunch
  make
}

check() {
  make -C dbus check
}

package_dbus-x11() {
  depends+=(libsystemd.so libaudit.so)
  provides=({,lib}dbus libdbus-1.so)
  conflicts=({,lib}dbus)
  replaces=(libdbus)

  DESTDIR="$pkgdir" make -C dbus install

  rm -r "$pkgdir"/{etc,var}

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING

  # Split docs
  mv "$pkgdir/usr/share/doc" "$srcdir"
}

package_dbus-x11-docs() {
  pkgdesc+=" (documentation)"
  provides=(dbus-docs)
  conflicts=(dbus-docs)
  depends=()

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
  mv doc "$pkgdir/usr/share"
}
