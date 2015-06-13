# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=pasystray-gtk2
_realname=pasystray
pkgver=0.5.2
pkgrel=2
pkgdesc="PulseAudio system tray (gtk2 version)"
arch=('i686' 'x86_64')
url="https://github.com/christophgysin/pasystray"
license=('LGPL')
groups=('multimedia')
depends=('libpulse' 'gtk2' 'libnotify' 'libx11' 'gnome-icon-theme')
makedepends=('automake' 'autoconf')
optdepends=(
	'paman: Launch PulseAudio manager from tray icon'
	'pavucontrol: Launch PulseAudio mixer from tray icon'
	'pavumeter: Launch PulseAudio volume meter from tray icon'
	'paprefs: Launch PulseAudio preferences from tray icon'
)
provides=('pasystray')
conflicts=('pasystray')
replaces=('pasystray')
source=("https://github.com/christophgysin/${_realname}/archive/${_realname}-${pkgver}.tar.gz")
md5sums=('0ea894a47a8ab10b830051e3bd89294d')

prepare() {
	cd ${srcdir}/${_realname}-${_realname}-${pkgver}

	# Fix build with GTK2
	sed -i 's|gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0)|gtk_hbox_new(FALSE, 0)|' src/systray.c
	sed -i 's|gtk_container_add(GTK_CONTAINER(hbox), image)|gtk_box_pack_start(GTK_BOX(hbox), image, FALSE, FALSE, 0)|' src/systray.c
	sed -i 's|gtk_container_add(GTK_CONTAINER(hbox), label)|gtk_box_pack_start(GTK_BOX(hbox), label, FALSE, FALSE, 15)|' src/systray.c
}

build() {
	cd ${srcdir}/${_realname}-${_realname}-${pkgver}

	aclocal
	autoconf
	autoheader
	automake --add-missing
	./configure \
		--prefix=/usr \
		--with-gtk=2 \
		--disable-avahi \
		--disable-appindicator
	make
}

package() {
	cd ${srcdir}/${_realname}-${_realname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
