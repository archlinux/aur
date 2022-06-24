# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgbase=dbus-xdg
pkgname=(dbus-xdg-elogind dbus-xdg-docs)
pkgver=1.14.0
pkgrel=1
pkgdesc="Freedesktop.org message bus system - but do not create a ~/.dbus directory (for non-systemd systems)"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=(GPL custom)
depends=(libx11 libelogind expat audit)
makedepends=(elogind xmlto docbook-xsl python yelp-tools doxygen git autoconf-archive)
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git?signed#tag=dbus-$pkgver"
        dbus-enable-elogind.patch
        no-fatal-warnings.diff
        dbus-launch-Move-dbus-autolaunch-stuff-to-runuser.patch)
sha256sums=('SKIP'
            'faffcaa5b295f49fcedeed2c9ece5298949096be3062fd99a4bf1a6ac3ad1ea0'
            'c10395be67e1127a58d7173b587fbbf16f8a8b271c41293558fcf9e27c185478'
            '691a84ca6543ac8d1cd19e915fee7dc967dae106e72200d58b682748265501fc')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie <simon.mcvittie@collabora.co.uk>

provides=('dbus' 'dbus-docs')
conflicts=('dbus' 'dbus-docs')

prepare() {
  cd dbus
  patch -Np 1 -i ../dbus-enable-elogind.patch
  # Allow us to enable checks without them being fatal
  patch -Np1 -i ../no-fatal-warnings.diff
  patch -p1 -i ../dbus-launch-Move-dbus-autolaunch-stuff-to-runuser.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd dbus
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/dbus-1.0 \
    --runstatedir=/run \
    --with-console-auth-dir=/run/console/ \
    --with-dbus-user=dbus \
    --with-system-pid-file=/run/dbus/pid \
    --with-system-socket=/run/dbus/system_bus_socket \
    --without-systemdsystemunitdir \
    --enable-inotify \
    --enable-libaudit \
    --disable-systemd \
    --disable-user-session \
    --enable-xml-docs \
    --enable-doxygen-docs \
    --enable-ducktype-docs \
    --disable-static \
    --enable-elogind \
    --enable-x11-autolaunch
  make
}

# check() {
#   make -C dbus -j1 check
# }

package_dbus-xdg-elogind() {
  depends+=(libelogind.so libaudit.so)
  provides=(libdbus libdbus-1.so)
  conflicts=(libdbus)
  replaces=(libdbus)

  DESTDIR="$pkgdir" make -C dbus install

  rm -r "$pkgdir"/{etc,var}

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  # Split docs
  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
}

package_dbus-xdg-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING
}

# vim:set sw=2 et:
