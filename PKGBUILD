# Maintainer: éclairevoyant
# Contributor: Vincent Grande <shoober420 at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan dot steffens at gmail dot com>
# Contributor: Ionut Biru <ibiru at archlinux dot org>

_pkgbase=colord
pkgbase="$_pkgbase-git"
pkgname=(colord-git colord-sane-git libcolord-git)
pkgver=1.4.6.r16.d735245
pkgrel=1
pkgdesc="System daemon for managing color devices"
arch=(x86_64)
url="https://www.freedesktop.org/software/$_pkgbase"
license=(GPL2)
depends=(
	dbus
	dconf
	lcms2
	libgudev
	libgusb
	polkit
	shared-mime-info
	sqlite
	systemd-libs
	udev
)
makedepends=(
	argyllcms
	bash-completion
	docbook-xsl
	git
	gobject-introspection
	gtk-doc
	meson
	sane
	systemd
	vala
)
provides=(colord colord-sane libcolord)
conflicts=(colord colord-sane libcolord)
options=(!emptydirs)
source=("git+https://github.com/hughsie/colord")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgbase describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	arch-meson $_pkgbase build \
		-D libcolordcompat=true \
		-D sane=true \
		-D vapi=true \
		-D print_profiles=true \
		-D daemon_user=colord
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

_pick() {
	local p="$1" f d; shift
	for f; do
		d="$srcdir/$p/${f#$pkgdir/}"
		mkdir -p "$(dirname "$d")"
		mv "$f" "$d"
		rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
	done
}

package_colord-git() {
	depends+=("libcolord=$pkgver")
	optdepends=('argyllcms: color profiling'
	            'colord-sane: SANE support')
	provides=(colord libcolorhug.so)
	conflicts=(colord)

	DESTDIR="$pkgdir" meson install -C build

	echo 'u colord - "Color management daemon" /var/lib/colord' |
		install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/colord.conf"

	cd "$pkgdir"

	_pick sane usr/lib/colord-sane
	_pick sane usr/lib/colord-plugins/libcolord_sensor_sane.so

	_pick lib usr/include/colord-1/colord{,.h}
	_pick lib usr/lib/libcolord{,compat}.so*
	_pick lib usr/lib/girepository-1.0/Colord-1.0.typelib
	_pick lib usr/lib/pkgconfig/colord.pc
	_pick lib usr/share/gir-1.0/Colord-1.0.gir
}

package_colord-sane-git() {
	pkgdesc+=" (SANE support)"
	depends=("colord=$pkgver" sane)
	provides=(colord-sane)
	conflicts=(colord-sane)

	mv sane/* "$pkgdir"
}

package_libcolord-git() {
	pkgdesc+=" (client library)"
	depends=(glib2 lcms2 systemd)
	provides=(libcolord libcolord.so)
	mv lib/* "$pkgdir"
}
