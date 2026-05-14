# Maintainer: nathawat <nathawat at no reply dot codeberg dot org>

pkgname="howdy-next"
pkgver=1.0.0
pkgrel=1
pkgdesc="A modernized fork of original Howdy, Facial recognition authentication for Linux"
arch=('x86_64')
url="https://codeberg.org/nathawat/howdy-next"
license=('MIT')
makedepends=('meson' 'ninja' 'cmake' 'opencv' 'openssl')
depends=('libinih' 'libevdev' 'opencv' 'curl' 'openssl')
optdepends=('linux-enable-ir-emitter: Enables infrared cameras that are not directly enabled out-of-the box')
provides=('howdy')
conflicts=('howdy' 'howdy-git' 'howdy-beta-git' 'howdy-bin' 'howdy-next-git')
replaces=('howdy-next-git')
backup=('etc/howdy/config.ini')
install=howdy-next.install
_tag="v${pkgver}"
source=(
	"${pkgname}-${pkgver}.tar.gz::https://codeberg.org/nathawat/howdy-next/archive/${_tag}.tar.gz"
	"polkit-agent-helper-howdy.conf"
)
b2sums=('0b8cd843f4194e47f52ac05d5d9c116a55a349f83a446b4f02d7c076cfda678dc4596c8260e0f63d4cf0119e19a15bbd3d07be6e7a998ae8cc0faa0022c4b7a3'
        'ac6c1a82d6b4a00e4d518ad49592d5eb0aa4590e6c584328230fe875af0604b56861235cfbf9cd8a93bc9f1130eafb02392705cfa3a247770eb013da8576922b')

prepare() {
	arch-meson "$srcdir/howdy-next" "$srcdir/build"
}

build() {
	meson compile -C "$srcdir/build"
}

package() {
	meson install -C "$srcdir/build" --destdir "$pkgdir"
	install -Dm644 "$srcdir/howdy-next/config/config.ini" "$pkgdir/etc/howdy/config.ini"
	install -Dm644 "$srcdir/howdy-next/LICENSE" "$pkgdir/usr/share/licenses/howdy-next/LICENSE"

	# Workaround for polkit 127+ breaking howdy (boltgolt/howdy#1077)
	install -Dm644 polkit-agent-helper-howdy.conf \
		"$pkgdir/usr/lib/systemd/system/polkit-agent-helper@.service.d/10-howdy.conf"
}
