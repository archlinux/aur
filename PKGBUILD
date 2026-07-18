# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=howdy-next
pkgver=3.3.1
pkgrel=1
pkgdesc="C++ rewrite of Howdy facial-recognition authentication on Linux"
arch=('x86_64')
url="https://codeberg.org/nathawat/howdy-next"
license=('MIT')
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
	'4fcf11bd523b2050565141006e1bb36441955c4c537ed0b68f7e50d7ad9cc8981a2a7bef9f255c75502ca172f29499f1df17c068c06a490eaaee059dfa0f512c'
	'ac6c1a82d6b4a00e4d518ad49592d5eb0aa4590e6c584328230fe875af0604b56861235cfbf9cd8a93bc9f1130eafb02392705cfa3a247770eb013da8576922b'
)

build() {
	cmake \
		-S "$srcdir/howdy-next" \
		-B "$srcdir/build" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_LIBEXECDIR=lib

	cmake --build "$srcdir/build"
}

check() {
	ctest \
		--test-dir "$srcdir/build" \
		--output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install "$srcdir/build"

	install -Dm644 "$srcdir/howdy-next/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Workaround for polkit 127+ breaking Howdy (boltgolt/howdy#1077).
	install -Dm644 "$srcdir/polkit-agent-helper-howdy.conf" \
		"$pkgdir/usr/lib/systemd/system/polkit-agent-helper@.service.d/10-howdy.conf"
}
