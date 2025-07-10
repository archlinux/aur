# Maintainer: 4javier <4javiereg4 at gmail dot com>
# Contributor: American_Jesus
# Contributor: Nitropowered
pkgname=notify-osd-customizable
_realname=notify-osd
pkgver=0.9.35
pkgrel=7
_realver=${pkgver}+16.04.20160415
pkgdesc="daemon that displays passive pop-up notifications, with leolik patch added"
arch=(i686 x86_64)
url="https://launchpad.net/~leolik/+archive/leolik"
license=('GPL')
groups=()
depends=('libwnck3' 'libnotify>=0.7.0' 'dbus-glib>=0.76' 'dconf' 'gsettings-desktop-schemas')
optdepends=('notifyconf: gui to customize notifies appearence')
makedepends=('pkgconfig' 'libnotify' 'gnome-common' 'glib2-devel')
provides=('notification-daemon' 'notify-osd')
conflicts=('notify-osd')
install=$pkgname.install
source=(${url}/+files/${_realname}_${_realver}-0ubuntu1-leolik~ppa2.tar.gz notify-osd fix_compilation.patch)
md5sums=('eaa4416b176bf86d406c08f5382958d9'
         '44180ae7a2ac9446133f76aface88bed'
         '14ab57acc4329a8ca27764ebfd5501ac')

prepare() {
  cd "$srcdir/$_realname-$_realver"
  patch -p1 -i ../fix_compilation.patch
}

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
