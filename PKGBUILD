# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc-embedded-wlroots
pkgver=0.7.1
pkgrel=1
pkgdesc='Wlroots based Phone compositor (matching wlroots embedded)'
url='https://source.puri.sm/Librem5/phoc'
license=('GPL3')
arch=(x86_64 aarch64)
depends=(
	mutter
	xcb-util-wm
	xcb-util-errors
)
makedepends=(
	ctags
	git
	libhandy
	meson
	vala
)
checkdepends=(xorg-server-xvfb)
provides=(phoc)
conflicts=(phoc wlroots)
source=(
	"git+${url}.git#tag=v${pkgver}"
	"git+https://source.puri.sm/Librem5/wlroots.git"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd phoc

	git submodule init
	git submodule set-url subprojects/wlroots "$srcdir/wlroots"
	git submodule update
}

build() {
	arch-meson phoc build -Dembed-wlroots=enabled
	meson compile -C build
}

check() {
	dbus-run-session xvfb-run \
		-s '-screen 0 1920x1080x24 -nolisten local' \
		meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
