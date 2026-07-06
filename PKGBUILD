# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=howdy-next-git
pkgver=3.3.0.r331.g65bc64c
pkgrel=1
pkgdesc="C++ rewrite of Howdy facial-recognition authentication on Linux"
arch=('x86_64')
url="https://codeberg.org/nathawat/howdy-next"
license=('MIT')
depends=('libinih' 'libevdev' 'pam' 'opencv>=5.0.0' 'curl' 'openssl' 'qt6-base')
makedepends=('git' 'meson>=1.11.0' 'gettext' 'yyjson>=0.12.0')
optdepends=('linux-enable-ir-emitter: Enables infrared cameras that are not directly enabled out-of-the box')
provides=('howdy' 'howdy-next')
conflicts=('howdy' 'howdy-next')
replaces=('howdy-next')
backup=('etc/howdy/config.ini')
install=howdy-next.install

source=(
	"howdy-next::git+https://codeberg.org/nathawat/howdy-next.git"
	"polkit-agent-helper-howdy.conf"
)
b2sums=('SKIP'
		'ac6c1a82d6b4a00e4d518ad49592d5eb0aa4590e6c584328230fe875af0604b56861235cfbf9cd8a93bc9f1130eafb02392705cfa3a247770eb013da8576922b')

pkgver() {
	cd howdy-next

	(
		set -o pipefail
		local commit_offset=592
		local commit_count
		commit_count=$(( $(git rev-list --count HEAD) - commit_offset ))

		git describe --long --abbrev=7 2>/dev/null |
			sed "s/^v//;s/\([^-]*-g\)/r$commit_count.g/;s/-/./g" ||
			printf "r%s.%s" "$commit_count" "$(git rev-parse --short=7 HEAD)"
	)
}

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
