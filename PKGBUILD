# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=loupe-git
pkgver=r189.aa7a2df
pkgrel=1
pkgdesc='Simple image viewer for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/Incubator/loupe'
license=(GPL)
depends=(
	'gtk4>=1:4.9.0'
	libadwaita
	libgweather-4
)
makedepends=(
	git
	itstool
	meson
	rust
)
provides=(loupe)
conflicts=(loupe)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd loupe
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	arch-meson loupe build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
