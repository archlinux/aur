# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=howdy-next
pkgver=3.3.0
pkgrel=1
pkgdesc="C++ rewrite of Howdy facial-recognition authentication on Linux"
arch=('x86_64')
url="https://codeberg.org/nathawat/howdy-next"
license=('MIT')
depends=('libinih' 'libevdev' 'pam' 'opencv>=5.0.0' 'curl' 'openssl' 'qt6-base')
makedepends=('meson>=1.11.0' 'gettext' 'yyjson>=0.12.0')
optdepends=('linux-enable-ir-emitter: Enables infrared cameras that are not directly enabled out-of-the box')
provides=('howdy')
conflicts=('howdy' 'howdy-next-git')
replaces=('howdy-next-git')
backup=('etc/howdy/config.ini')
install=howdy-next.install

_tag="v${pkgver}"
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/${_tag}.tar.gz"
	"polkit-agent-helper-howdy.conf"
)
b2sums=('2dce843867b81de0f713019ad2e2e9b8500570556d6fa51e7eb8ab8706a15534b94442c81b22bc3c204adfef9696336ec134d28d86c3168ee85067a706e787d3'
		'ac6c1a82d6b4a00e4d518ad49592d5eb0aa4590e6c584328230fe875af0604b56861235cfbf9cd8a93bc9f1130eafb02392705cfa3a247770eb013da8576922b')

build() {
	arch-meson "$srcdir/howdy-next" "$srcdir/build" \
		-Dconfig_dir=/etc/howdy \
		-Duser_models_dir=/etc/howdy/models

	meson compile -C "$srcdir/build"
}

check() {
	meson test -C "$srcdir/build" --print-errorlogs
}

package() {
	meson install -C "$srcdir/build" --destdir "$pkgdir"

	chmod 4755 "$pkgdir/usr/lib/howdy/howdy-auth-helper"

	install -d -m750 "$pkgdir/etc/howdy/models"
	install -m640 "$srcdir/howdy-next/config/config.ini" "$pkgdir/etc/howdy/config.ini"

	install -Dm644 "$srcdir/howdy-next/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Workaround for polkit 127+ breaking howdy (boltgolt/howdy#1077)
	install -Dm644 "$srcdir/polkit-agent-helper-howdy.conf" \
		"$pkgdir/usr/lib/systemd/system/polkit-agent-helper@.service.d/10-howdy.conf"
}
