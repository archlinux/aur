# Maintainer: Martin Franc <me@martinfranc.eu>

pkgname=wob
pkgver=0.14
pkgrel=1
pkgdesc='A lightweight overlay volume/backlight/progress/anything bar for Wayland'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/francma/wob'
license=('ISC')
depends=('wayland')
makedepends=('meson' 'wayland-protocols' 'scdoc' 'libinih')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/francma/wob/releases/download/${pkgver}/wob-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig::https://github.com/francma/wob/releases/download/${pkgver}/wob-${pkgver}.tar.gz.sig"
	"wob.service"
	"wob.socket"
)
validpgpkeys=('5C6DA024DDE27178073EA103F4B432D5D67990E3')
sha512sums=(
	'8c294d8d450ab5295369c8fef1a57414ceac5b0d5e1d037883ccf76ac576b6ab5e7b3d74796d50c7d93b2e9b3eccc4750fbdef8a47464be0fb363abb8ab4fb71'
	'SKIP'
	'f7f077a3f99a87a6f815971a71f814e740ac0ecd0e26baf8059547ffd0ac5d106319bb034a147b7d70384a19bc23fc9b45a0aa4a7f81ccec606eccb0e0bf26fe'
	'0f2a4947761e5b22e2b046dc592c3a73d163a6e9d83717d61e90fedda1c6715cbeffa76bbeabc4866a5830828379c8ab3da516707015343741312c8234b7d011'
)

build() {
	mkdir -p build
	arch-meson build "${pkgname}-${pkgver}" -D b_ndebug=true
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 wob.service -t "$pkgdir/usr/lib/systemd/user"
	install -Dm644 wob.socket -t "$pkgdir/usr/lib/systemd/user"
	install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
	ninja -C build test
}
