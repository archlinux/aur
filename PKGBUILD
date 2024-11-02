# Maintainer: Alex Gartner <aur@agartner.com>
pkgname=swaylock-dpms-git
pkgver=1.8.0.r4.gbd8fd89
pkgrel=1
license=(custom:MIT)
pkgdesc='swaylock with dpms support'
url=https://github.com/gartnera/swaylock
arch=(x86_64)
provides=("swaylock=${pkgver%%.r*}")
conflicts=(swaylock)
depends=(cairo pam wayland gdk-pixbuf2 libxkbcommon)
makedepends=(meson ninja git wayland-protocols scdoc)
source=(
	"${pkgname}::git+https://github.com/gartnera/swaylock"
)

sha512sums=(
    'SKIP'
)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"

	rm -rf build
	meson build \
		--prefix /usr \
		--buildtype plain

	ninja -C build
}

package () {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
