# Maintainer: meow <sosdjolfkhgsldjkfh@gmail.com>
# this is based off https://aur.archlinux.org/packages/xfce4-notifyd-git

pkgname=xfce4-notifyd-pango-markup-git
pkgver=0.9.7.r83.g68bcaf1
pkgrel=1
pkgdesc='notification daemon for the xfce desktop - git checkout with a patch to allow notification body, summary, and button to have pango markup. based off of: https://aur.archlinux.org/packages/xfce4-notifyd-git'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/applications/xfce4-notifyd'
groups=('xfce4-goodies')
depends=('libxfce4ui' 'hicolor-icon-theme' 'libnotify' 'gtk-layer-shell' 'libcanberra' 'libxfce4util' 'sqlite' 'xfconf')
makedepends=('xfce4-dev-tools' 'exo' 'intltool' 'git' 'glib2-devel')
conflicts=('xfce4-notifyd')
provides=('notification-daemon' 'xfce4-notifyd')
options=('!libtool')
install=${pkgname}.install
source=('git+https://gitlab.xfce.org/apps/xfce4-notifyd.git'
        'body_markup.patch'
        'summary_markup.patch'
        'button_markup.patch')
sha256sums=('SKIP'
            'eacb3ddfdbc547ec9dfe18c71b62112945aefe27be8eadbefff90320dbe4c487'
            '2ef314d5431de85309bbb021f12012412059bf844fa709317f8f46c30f7a81df'
            '5b44cc6ac6923c1f0f6f18bcfe300927dbc742bb1f52ca2432c741286b3ca730')

pkgver() {
	cd xfce4-notifyd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-pango-markup-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	echo "applying patches..."
	patch -uN --verbose "./xfce4-notifyd/xfce4-notifyd/xfce-notify-window.c" "./body_markup.patch"
	patch -uN --verbose "./xfce4-notifyd/xfce4-notifyd/xfce-notify-window.c" "./summary_markup.patch"
	patch -uN --verbose "./xfce4-notifyd/xfce4-notifyd/xfce-notify-window.c" "./button_markup.patch"
	echo "done applying patches!"
}

build() {
	cd xfce4-notifyd/

	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib/xfce4 \
		--localstatedir=/var \
		--disable-static
	make
}

package() {
	cd xfce4-notifyd/

	make DESTDIR=${pkgdir} install
}
