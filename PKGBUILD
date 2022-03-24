# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=42.0
pkgrel=1
pkgdesc='Phone dialer and call handler'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/calls'
license=(GPL3)
depends=(
	callaudiod
	feedbackd
	folks
	gom
	libhandy
	libpeas
	modemmanager
	sofia-sip
)
makedepends=(
	git
	gobject-introspection
	meson
	vala
)
options=(debug)
_commit=${pkgver}
source=(
	"git+${url}.git#commit=$_commit"
	"git+https://gitlab.gnome.org/World/Phosh/libcall-ui.git"
)
b2sums=('SKIP' 'SKIP')

prepare() {
	cd calls

	git submodule init
	git submodule set-url subprojects/libcall-ui "$srcdir/libcall-ui"
	git submodule update
}


build() {
	arch-meson calls build -D tests=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
