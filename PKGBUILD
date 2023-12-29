# Maintainer: Haotian Xue <xuehaotian at outlook dot com>
# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Andrey Vetrov <vetrov at mail dot ru>
# Based on the file created for Arch Linux by:
# Jan de Groot <jgc@archlinux.org>
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=dbus-x11-git
pkgname=(dbus-x11-git dbus-x11-docs-git)
pkgver=1.15.8+17+gd9756df2
pkgrel=1
pkgdesc="Freedesktop.org message bus system (with x11 autolaunch) (git version)"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=(GPL custom)
depends=(systemd-libs expat audit)
makedepends=(systemd xmlto docbook-xsl python yelp-tools doxygen git meson libx11)
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git"
        "dbus-reload.hook"
        "port_in_use_fix.patch")
sha256sums=('SKIP'
            'd636205622d0ee3b0734360225739ef0c7ad2468a09489e6ef773d88252960f3'
            '78f985647f112bbe25dfea26f9dd40f49e26389da8fa09a667db54e58f22c2d9')
pkgver() {
  cd dbus
  git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

build() {
  patch --strip=1 < port_in_use_fix.patch

  cd dbus

  meson setup _build \
    -D buildtype=plain \
    --wrap-mode=nofallback \
    -D b_ndebug=true \
    -D b_lto=true \
    -D b_pie=true \
    -D prefix=/usr \
    -D sbindir=bin \
    -D sysconfdir=/etc \
    -D localstatedir=/var \
    -D libexecdir=/usr/lib/dbus-1.0 \
    -D dbus_user=dbus \
    -D system_pid_file=/run/dbus/pid \
    -D system_socket=/run/dbus/system_bus_socket \
    -D systemd_system_unitdir=/usr/lib/systemd/system \
    -D inotify=enabled \
    -D libaudit=enabled \
    -D systemd=enabled \
    -D user_session=true \
    -D verbose_mode=false \
    -D asserts=false \
    -D checks=false \
    -D x11_autolaunch=enabled

  meson configure --no-pager _build

  ninja -C _build
}

check() {
  cd dbus
  ninja -C _build test
}

package_dbus-x11() {
  depends+=(libsystemd.so libaudit.so)
  provides=({,lib}dbus libdbus-1.so)
  conflicts=({,lib}dbus)
  replaces=(libdbus)

  cd dbus

  DESTDIR="$pkgdir" ninja -C _build install

  rm -r "$pkgdir"/{etc,var}

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  install -Dm644 "$srcdir/dbus-reload.hook" -t "$pkgdir/usr/share/libalpm/hooks"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"

  # Split docs
  mv "$pkgdir/usr/share/doc" "$srcdir"
}

package_dbus-x11-docs() {
  pkgdesc+=" (documentation)"
  provides=(dbus-docs)
  conflicts=(dbus-docs)
  depends=()

  install -Dm644 "dbus/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
  mv doc "$pkgdir/usr/share"
}
