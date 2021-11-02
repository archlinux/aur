# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.9.0
pkgrel=1
pkgdesc='Wlroots based Phone compositor'
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
arch=(x86_64 aarch64)
depends=(
	mutter
	'wlroots=0.12.0'
)
makedepends=(
	ctags
	libhandy
	meson
	vala
)
checkdepends=(xorg-server-xvfb)
source=("${url}/-/archive/v${pkgver}/phoc-v${pkgver}.tar.gz")
sha256sums=('5fce97ed8fe47ea801d8802136180339c7491d085e1b4b4757eb42ed62e8172d')

build() {
	arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled
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
