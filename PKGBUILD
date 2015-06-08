# Maintainer: 4javier <4javiereg4 at gmail dot com>
# Contributor: American_Jesus
# Contributor: Nitropowered
pkgname=notify-osd-customizable
_realname=notify-osd
pkgver=0.9.35
pkgrel=3
_realver=${pkgver}+13.10.20130917.1
pkgdesc="daemon that displays passive pop-up notifications, with leolik patch added"
arch=(i686 x86_64)
url="https://launchpad.net/~leolik/+archive/leolik"
license=('GPL')
groups=()
depends=('libwnck3' 'libnotify>=0.7.0' 'dbus-glib>=0.76' 'dconf' 'gsettings-desktop-schemas')
optdepends=('notifyconf: gui to customize notifies appearence')
makedepends=('pkgconfig' 'libnotify' 'gnome-common')
provides=('notification-daemon' 'notify-osd')
conflicts=('notify-osd')
install=$pkgname.install
source=(${url}/+files/${_realname}_${_realver}-0ubuntu1-leolik~ppa0.tar.gz notify-osd)
md5sums=('fb1b2b3e5c41d2ef328c56340719388a'
         '44180ae7a2ac9446133f76aface88bed')

build() {
  cd "$srcdir/$_realname-$_realver"
  #sed -i 's,/usr/lib/notify-osd/,@LIBEXECDIR@/,' data/org.freedesktop.Notifications.service.in

  export AUTOMAKE=automake
  sh ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-schemas-compile
 
  make || return 1
 }

package() {
	cd "$srcdir/$_realname-$_realver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 ${srcdir}/notify-osd ${pkgdir}/etc/skel/.notify-osd
 }
