# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgname=(dbus-xdg-elogind dbus-docs)
pkgver=1.12.20
pkgrel=1
pkgdesc="Freedesktop.org message bus system - but do not create a ~/.dbus directory (for non-systemd systems)"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=(GPL custom)
depends=(libx11 libelogind expat audit)
makedepends=(elogind xmlto docbook-xsl python yelp-tools doxygen git autoconf-archive)
source=("https://gitlab.freedesktop.org/dbus/dbus/-/archive/dbus-$pkgver/dbus-dbus-$pkgver.tar.gz"
        dbus-enable-elogind.patch
        no-fatal-warnings.diff
        dbus-launch-Move-dbus-autolaunch-stuff-to-runuser.patch)
sha256sums=('SKIP'
            'faffcaa5b295f49fcedeed2c9ece5298949096be3062fd99a4bf1a6ac3ad1ea0'
            '6958eeec07557b92a28419eb1702331ee2f0a6fd17285e37dfb6130b9fa4cf6e'
            '691a84ca6543ac8d1cd19e915fee7dc967dae106e72200d58b682748265501fc')
provides=('dbus')
conflicts=('dbus')

prepare() {
  cd "dbus-dbus-$pkgver"
  patch -Np 1 -i ../dbus-enable-elogind.patch
  # Allow us to enable checks without them being fatal
  patch -Np1 -i ../no-fatal-warnings.diff
  patch -p1 -i ../dbus-launch-Move-dbus-autolaunch-stuff-to-runuser.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "dbus-dbus-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/dbus-1.0 \
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

check() {
  make -C "dbus-dbus-$pkgver" check
}

package_dbus-xdg-elogind() {
  depends+=(libelogind.so libaudit.so)
  provides=(libdbus libdbus-1.so)
  conflicts=(libdbus)
  replaces=(libdbus)

  DESTDIR="$pkgdir" make -C "dbus-dbus-$pkgver" install

  rm -r "$pkgdir"/{etc,var}

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "dbus-dbus-$pkgver"/COPYING

  # Split docs
  mv "$pkgdir/usr/share/doc" "$srcdir"
}

package_dbus-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 "dbus-dbus-$pkgver"/COPYING
  mv doc "$pkgdir/usr/share"
}

# vim:set sw=2 et:
