# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=howdy-next-git
pkgver=3.4.0.r22.ge74f9d8
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
	'git'
)
optdepends=(
	'linux-enable-ir-emitter: Enables infrared cameras that are not directly enabled out-of-the-box'
)
provides=(
	'howdy'
	"howdy-next=${pkgver}"
)
conflicts=(
	'howdy'
	'howdy-next'
)
backup=('etc/howdy/config.ini')
install=howdy-next.install

source=(
	"howdy-next::git+${url}.git"
	"polkit-agent-helper-howdy.conf"
)
b2sums=(
	'SKIP'
	'ac6c1a82d6b4a00e4d518ad49592d5eb0aa4590e6c584328230fe875af0604b56861235cfbf9cd8a93bc9f1130eafb02392705cfa3a247770eb013da8576922b'
)

pkgver() {
	cd "$srcdir/howdy-next"

	local description
	if description=$(git describe --long --tags --abbrev=7 2>/dev/null); then
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' <<< "$description"
	else
		printf 'r%s.%s' \
			"$(git rev-list --count HEAD)" \
			"$(git rev-parse --short=7 HEAD)"
	fi
}

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
	cd "$srcdir/howdy-next"

	ctest \
		--preset release \
		--test-dir "$srcdir/build"
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
