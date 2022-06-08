# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc-embedded-wlroots
pkgver=0.20.0
pkgrel=1
pkgdesc='Wlroots based Phone compositor (matching wlroots embedded)'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
depends=(
	mutter
	seatd
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm
)
makedepends=(
	ctags
	git
	libhandy
	meson
	vala
	vulkan-headers
	wayland-protocols
)
provides=(phoc)
conflicts=(phoc wlroots)
source=(
	"git+${url}.git#tag=v${pkgver}"
	"git+https://source.puri.sm/Librem5/wlroots.git"
)
b2sums=('SKIP' 'SKIP')

prepare() {
	cd phoc

	git submodule init
	git submodule set-url subprojects/wlroots "${srcdir}/wlroots"
	git submodule update
}

build() {
	arch-meson phoc build -Dembed-wlroots=enabled
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
