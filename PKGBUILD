# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
#
pkgname=dbus-nosystemd
pkgver=1.6.18
pkgrel=2
pkgdesc="Freedesktop.org message bus system"
url="http://www.freedesktop.org/Software/dbus"
arch=(i686 x86_64)
license=('GPL' 'custom')
# dep on shadow for install scriptlet FS#29341
depends=('expat' 'coreutils' 'filesystem' 'shadow')
makedepends=('libx11')
optdepends=('libx11: dbus-launch support')
provides=('dbus-core' "dbus=${pkgver}" "libdbus=${pkgver}")
conflicts=('dbus-core' 'dbus')
replaces=('dbus-core' 'dbus')
install=dbus-nosystemd.install
source=(http://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.gz #{,.asc}
	30-dbus dbus memleak.patch)
md5sums=('b02e9c95027a416987b81f9893831061'
         '3314d727fa57fc443fce25b5cbeebbcc'
         'f0364f3f5dc5f653bb05d39aa36e3264'
         'cf86d68e39d975cec1e9f0342eb9b142')

prepare() {
	cd dbus-$pkgver

	patch -Np1 -i ../memleak.patch
}

build() {
  cd dbus-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=dbus \
      --with-system-pid-file=/run/dbus/pid \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-console-auth-dir=/run/console/ \
      --enable-inotify --disable-dnotify \
      --disable-verbose-mode --disable-static \
      --disable-tests --disable-asserts

  make
}

package(){
  cd dbus-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/var/run"

  install -Dm755 ../dbus "$pkgdir/etc/rc.d/dbus"
  install -Dm755 ../30-dbus "$pkgdir/etc/X11/xinit/xinitrc.d/30-dbus"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/dbus/COPYING"
}
