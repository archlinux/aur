pkgname=notify-osd-git
_srcdir=notify-osd
pkgver=0.9.34.r26.6e1e156
pkgrel=1
pkgdesc="Customizable Canonical's on-screen-display notification (notify-osd) daemon."
arch=(x86_64)
url="https://gitlab.com/justanoobcoder/notify-osd.git"
license=('GPL')
depends=('libwnck3' 'libnotify>=0.7.0' 'dbus-glib>=0.76' 'dconf' 'gsettings-desktop-schemas')
makedepends=('pkgconf' 'libnotify' 'gnome-common' 'git')
provides=('notification-daemon')
conflicts=('notify-osd')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$_srcdir"
    printf "%s.r%s.%s" "$(grep AC_INIT configure.ac | awk -F', ' '{print $2}')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_srcdir"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "$_srcdir"
	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
		--disable-static --disable-schemas-compile
  	make
}

package() {
    cd "$_srcdir"
	make DESTDIR="$pkgdir/" install
}
