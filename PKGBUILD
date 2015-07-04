# Maintainer: Sebastian Lenz <sebastian@archusers.de>
pkgname=gnome-shell-extension-xrandr-indicator-git
pkgver=20110502
pkgrel=1
pkgdesc="Replace the GTK+ based indicator from gnome-settings-daemon with a native one. Lets the user rotate the laptop monitor and open display preferences quickly."
arch=('i686' 'x86_64')
url="http://live.gnome.org/GnomeShell/Extensions"
license=('GPL' 'LGPL')
depends=('gnome-shell-extension-common-git')
makedepends=('git' 'gnome-common' 'intltool')
conflicts=('gnome-shell-extensions-git')
_gitroot="git://git.gnome.org/gnome-shell-extensions"
_gitname="gnome-shell-extensions"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot --depth=1
    
		cd $_gitname
		git branch -f gnome-3-0 origin/gnome-3-0
		git checkout gnome-3-0
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd ${srcdir}/${_gitname}
	./autogen.sh --prefix=/usr --enable-extensions="xrandr-indicator"
}
package() {
	cd ${srcdir}/${_gitname}
	make DESTDIR=${pkgdir} install
	rm -r ${pkgdir}/usr/share/locale
}

