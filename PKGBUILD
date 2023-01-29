# Maintainer: Thomas Booker (CoderThomasB) <tw.booker@outlook.com>
# Contributor: <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=feedbackd
pkgver=0.0.2
pkgrel=1
pkgdesc='A daemon to provide haptic feedback on events'
arch=(x86_64 aarch64)
url='https://source.puri.sm/Librem5/feedbackd'
license=(GPL3)
depends=(
	dconf
	gsound
	json-glib
	libgudev
)
makedepends=(
	gobject-introspection
	meson
	vala
	git
	# requered for man docs
	# python-docutils
)

_tag=fca952f813124110c9dabd766e85255992187c32
source=(
	"git+${url}.git#tag=${_tag}"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "${pkgname}"
	git describe --tags | sed 's/^v//'
}

prepare() {
	cd "${pkgname}"

	git submodule init
	git submodule update
}

build() {
	arch-meson "${pkgname}" build -Dgtk_doc=false -Dman=false -Dtests=true -Ddaemon=true
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
