# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.8.0
pkgrel=1
pkgdesc='Wlroots based Phone compositor'
url='https://source.puri.sm/Librem5/phoc'
license=('GPL3')
arch=(x86_64 aarch64)
depends=(
	mutter
	'wlroots<0.12.0'
)
makedepends=(
	ctags
	libhandy
	meson
	vala
)
checkdepends=(xorg-server-xvfb)
source=("${url}/-/archive/v${pkgver}/phoc-v${pkgver}.tar.gz")
sha256sums=('ef2f3876543e0ff9189dbc80abe28daf29a278d1e62a64cc060ac4032df505e6')

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
