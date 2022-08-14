# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=fractal-git
_gitname=fractal
pkgver=5.alpha.r724.b55752c1
pkgrel=1
pkgdesc="Matrix messaging app for GNOME written in Rust"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/GNOME/fractal"
depends=('gtk4' 'gtksourceview5' 'gst-plugins-base-libs' 'gst-editing-services' 'gspell' 'libadwaita>=1:1.2.alpha' 'pipewire' 'libshumate' 'org.freedesktop.secrets')
conflicts=('fractal')
provides=('fractal')
makedepends=('rust' 'git' 'meson' 'clang')
source=("git+https://gitlab.gnome.org/GNOME/fractal.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	(
		set -o pipefail

		# the -next rewrite is a completely separate git history, which does not have any tags yet
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "5.alpha.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_gitname}/"
	arch-meson . _build
	ninja -C _build
}

package() {
	cd "${srcdir}/${_gitname}/"
	DESTDIR="${pkgdir}" ninja -C _build install
}
