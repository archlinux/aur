# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=howdy-next
pkgver=3.4.0
pkgrel=1
pkgdesc="C++ rewrite of Howdy facial-recognition authentication on Linux"
arch=('x86_64')
url="https://codeberg.org/nathawat/howdy-next"
license=('GPL-3.0-or-later')
depends=(
	'acl'
	'curl>=7.85.0'
	'glibc>=2.34'
	'libevdev'
	'libinih>=59'
	'openssl'
	'opencv>=5.0.0'
	'pam'
	'qt6-base'
	'yyjson>=0.12.0'
)
makedepends=(
	'cmake>=3.31'
	'gettext'
)
optdepends=(
	'linux-enable-ir-emitter: Enables infrared cameras that are not directly enabled out-of-the-box'
)
provides=('howdy')
conflicts=(
	'howdy'
	'howdy-next-git'
)
backup=('etc/howdy/config.ini')
install=howdy-next.install

_tag="v${pkgver}"
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/${_tag}.tar.gz"
	"polkit-agent-helper-howdy.conf"
)
b2sums=(
	'671f1da0a2b040d407d264e8c897c96ddbabac9b50eb9a3cf75c98f0a45fdfa6c245a336bdcefaf088258bdbe0a37cdd43c4d51b1b12c2dc40be8c64d4225623'
	'ac6c1a82d6b4a00e4d518ad49592d5eb0aa4590e6c584328230fe875af0604b56861235cfbf9cd8a93bc9f1130eafb02392705cfa3a247770eb013da8576922b'
)

build() {
	cmake \
		-S "$srcdir/howdy-next" \
		-B "$srcdir/build" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_LIBEXECDIR=lib \
		-DHOWDY_LICENSES_INSTALL_DIR="share/licenses/$pkgname"

	cmake --build "$srcdir/build"
}

check() {
	ctest \
		--test-dir "$srcdir/build" \
		--output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install "$srcdir/build"

	# Arch provides GPL-3.0-or-later through the licenses package.
	rm "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Relax polkit-agent-helper sandbox directives required by Howdy,
	# as recommended by polkit (see polkit-agent-helper(8)).
	install -Dm644 "$srcdir/polkit-agent-helper-howdy.conf" \
		"$pkgdir/usr/lib/systemd/system/polkit-agent-helper@.service.d/10-howdy.conf"
}
