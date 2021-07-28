# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phosh-git
pkgver=0.12.1.r2.g3e1ba9d
pkgrel=1
pkgdesc='A pure Wayland shell prototype for GNOME on mobile devices'
url='https://source.puri.sm/Librem5/phosh'
license=('GPL3')
arch=(x86_64 aarch64)
depends=(
	feedbackd
	libhandy
	phoc
)
makedepends=(
	ctags
	git
	meson
	vala
)
provides=(phosh)
conflicts=(phosh)
# checkdepends=(xorg-server-xvfb)
source=(
	"git+${url}.git"
	"git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd phosh
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd phosh

	git submodule init
	git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
	git submodule update
}

build() {
	arch-meson phosh build # -D gtk_doc=true
	meson compile -C build
}

# check() {
# 	dbus-run-session xvfb-run \
# 		-s '-screen 0 1920x1080x24 -nolisten local' \
# 		meson test -C build --print-errorlogs
# }

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
