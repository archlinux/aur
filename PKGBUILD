# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
#
pkgname=dbus-nosystemd
pkgver=1.8.0
pkgrel=2
pkgdesc="Freedesktop.org message bus system"
url="http://www.freedesktop.org/Software/dbus"
arch=(i686 x86_64)
license=('GPL' 'custom')
groups=('eudev-base')
# dep on shadow for install scriptlet FS#29341
depends=('expat' 'coreutils' 'filesystem' 'shadow' "libdbus=${pkgver}")
makedepends=('libx11' 'xmlto' 'docbook-xsl')
optdepends=('libx11: dbus-launch support'
            'dbus-openrc: dbus openrc initscript')
provides=('dbus-core' "dbus=${pkgver}")
conflicts=('dbus-core' 'dbus')
replaces=('dbus-core' 'dbus')
install=dbus-nosystemd.install
source=(http://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.gz #{,.asc}
	30-dbus dbus)
md5sums=('059fbe84e39fc99c67a14f15b1f39dff'
         '3314d727fa57fc443fce25b5cbeebbcc'
         '6f116e46adcbe99326ee67e597598d29')

build() {
  cd dbus-$pkgver
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 \
      --with-dbus-user=dbus \
      --with-system-pid-file=/run/dbus/pid \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-console-auth-dir=/run/console/ \
      --enable-inotify \
      --disable-verbose-mode \
      --disable-static \
      --disable-tests \
      --disable-asserts \
      --disable-systemd

  make
}

package(){
  cd dbus-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/var/run"

  rm -r "$pkgdir"/usr/include
  rm -r "$pkgdir"/usr/lib/pkgconfig
  rm -r "$pkgdir"/usr/lib/libdbus*
  rm -r "$pkgdir"/usr/lib/dbus-1.0/include

  install -Dm755 ../dbus "$pkgdir/etc/rc.d/dbus"
  install -Dm755 ../30-dbus "$pkgdir/etc/X11/xinit/xinitrc.d/30-dbus"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/dbus/COPYING"
}

