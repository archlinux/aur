pkgname=notify-osd-syaoran
pkgver=0.9.34.r20.e46f243
pkgrel=1
pkgdesc="Customizable Canonical's on-screen-display notification (notify-osd) daemon."
arch=(x86_64)
url="https://gitlab.com/justanoobcoder/notify-osd-syaoran.git"
license=('GPL')
depends=('libwnck3' 'libnotify>=0.7.0' 'dbus-glib>=0.76' 'dconf' 'gsettings-desktop-schemas')
makedepends=('pkgconfig' 'libnotify' 'gnome-common' 'git')
provides=('notification-daemon')
conflicts=('notify-osd')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s.r%s.%s" "$(grep AC_INIT configure.in | awk -F', ' '{print $2}')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "$pkgname"
	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
		--disable-static --disable-schemas-compile
  	make
}

package() {
    cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
