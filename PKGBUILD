# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=souk-git
pkgver=r262.9381b9f
pkgrel=1
pkgdesc="Independent Flatpak App Store"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.gnome.org/haecker-felix/souk"
license=(GPL3)
depends=(
	flatpak
	gtk4
	libadwaita
)
makedepends=(
	cargo
	git
	meson
)
provides=(souk)
conflicts=(souk)
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
	cd souk
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	arch-meson souk build -Dtests=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
