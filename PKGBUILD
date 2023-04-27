# Maintainer: éclairevoyant
# Contributor: Brian Bidulock <bidulock at openss7 dot org>
# Contributor: Jan de Groot <jgc at archlinux dot org>
# Contributor: Aline Freitas <aline at alinefreitas dot com dot br>

_pkgname=polkit
pkgname="$_pkgname-git"
pkgver=122.r28.4c6d183
pkgrel=1
epoch=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
arch=(i686 x86_64)
license=(LGPL)
url="https://www.freedesktop.org/wiki/Software/polkit/"
depends=(duktape glib2 pam systemd)
makedepends=(git gobject-introspection gtk-doc meson)
checkdepends=(python-dbusmock)
backup=(etc/pam.d/polkit-1)
provides=("$_pkgname=${pkgver%%.r*}" libpolkit-{agent,gobject}-1.so)
conflicts=("$_pkgname")
source=(git+https://gitlab.freedesktop.org/polkit/$_pkgname.git)
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	local meson_options=(
		-D examples=true
		-D gtk_doc=true
		-D man=true
		-D os_type=redhat
		-D session_tracking=libsystemd-login
		-D tests=true
	)

	arch-meson $_pkgname build "${meson_options[@]}"
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs -t 3
}

package() {
	meson install -C build --destdir "$pkgdir"

	install -d -o root -g 102 -m 750 "$pkgdir"/{etc,usr/share}/polkit-1/rules.d
	install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u polkitd 102 "PolicyKit daemon"
m polkitd proc
END
}
