# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

pkgbase=dbus-x11
pkgname=(dbus-x11 dbus-x11-docs)
pkgver=1.12.12
pkgrel=1
pkgdesc="Freedesktop.org message bus system (with x11 autolaunch)"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=(x86_64)
license=(GPL custom)
depends=(libsystemd expat)
makedepends=(systemd xmlto docbook-xsl python yelp-tools doxygen git autoconf-archive graphviz libx11)
_commit=d4f8423bbff9b3c5fca2d8009c28d1cff4652788  # tags/dbus-1.12.12^0
source=("git+https://anongit.freedesktop.org/git/dbus/dbus#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

pkgver() {
  cd dbus
  git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {
  cd dbus

  # Reduce docs size
  printf '%s\n' >>Doxyfile.in \
    HAVE_DOT=yes DOT_IMAGE_FORMAT=svg INTERACTIVE_SVG=yes

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd dbus
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    runstatedir=/run \
    --libexecdir=/usr/lib/dbus-1.0 \
    --with-system-socket=/run/dbus/system_bus_socket \
    --with-dbus-session-bus-connect-address=unix:runtime=yes \
    --with-dbus-user=dbus \
    --enable-user-session \
    --disable-static \
    --enable-x11-autolaunch
  make
}

check() {
  make -C dbus check
}

package_dbus-x11() {
  provides=({,lib}dbus)
  conflicts=(libdbus)
  replaces=(libdbus)

  DESTDIR="$pkgdir" make -C dbus install

  rm -r "$pkgdir/var/run"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 dbus/COPYING

  # We have a pre-assigned uid (81)
  echo 'u dbus 81 "System Message Bus"' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/dbus.conf"

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
