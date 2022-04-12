pkgname=pocillo-gtk-theme-git
pkgver=0.9.r0.g7a12511c
pkgrel=1
pkgdesc='Theme for the Budgie Desktop that has Material Design elements and styled using the Arc colour palette'
arch=('any')
url=https://github.com/UbuntuBudgie/pocillo-gtk-theme
license=(GPL2)
depends=(gtk-engine-murrine gnome-themes-extra)
makedepends=(meson dart-sass git)
optdepends=('budgie-desktop: The Budgie desktop')
provides=(pocillo-gtk-theme)
conflicts=(pocillo-gtk-theme)
source=("${pkgname}::git+${url}" meson-fixes.patch)
b2sums=('SKIP'
        '21964b269b34ac7c601cdc098d2d9be9e8d98685385d5bad5c80c231ea2edee5969fc9d17df4fa72e617d8dc3402cc1b21b01668c30a35dcf905c1a41d224acd')

pkgver() {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${pkgname}"
	patch -p1 < "${srcdir}/meson-fixes.patch"
}

build() {
	arch-meson \
		-Ddocumentation=true \
		-Dflatpak=false \
		-Dgtk4_version=4.6 \
		-Dgnome_shell_version=42 \
		-Dcolors=default,light,dark \
		-Dsizes=default,slim \
		_build "${pkgname}"
	meson compile -C _build
}

package() {
	meson install -C _build --destdir="${pkgdir}"
}
