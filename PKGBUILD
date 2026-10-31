# Maintainer: Scott <158021536+nathawatc@users.noreply.github.com>

pkgname=howdy-next
pkgver=3.4.2
pkgrel=2
pkgdesc="Modern C++ reimplementation of Howdy facial authentication on Linux"
arch=('x86_64')
url="https://github.com/nathawatc/howdy-next"
license=('GPL-3.0-or-later')
depends=(
	'acl'
	'curl>=7.85.0'
	'glibc>=2.36'
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
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz"
	"polkit-agent-helper-howdy.conf"
)
b2sums=(
	'9ea44933c9c694d8398f5ec6f701efed9c57bf0bfb8eaf4612e4355532113c50d1d7f72227f0138b10d09f5ce14adbbf7c98f4d83e7b431a1d2d2395a3f885cf'
	'ac6c1a82d6b4a00e4d518ad49592d5eb0aa4590e6c584328230fe875af0604b56861235cfbf9cd8a93bc9f1130eafb02392705cfa3a247770eb013da8576922b'
)

build() {
	cmake \
		-S "$srcdir/$pkgname-$pkgver" \
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
