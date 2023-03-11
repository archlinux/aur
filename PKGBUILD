# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=fractal-git
_gitname=fractal
epoch=1
pkgver=5.alpha1.r166.g52ed7d3c
pkgrel=1
pkgdesc="Matrix messaging app for GNOME written in Rust"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/GNOME/fractal"
depends=('gtk4' 'gtksourceview5' 'gst-plugins-base-libs' 'gst-editing-services' 'gspell' 'libadwaita>=1:1.3alpha' 'pipewire' 'libshumate' 'org.freedesktop.secrets')
conflicts=('fractal')
provides=("fractal=$pkgver" 'fractal-next')
replaces=('fractal-next')
makedepends=('rust' 'git' 'meson' 'clang')
source=("git+https://gitlab.gnome.org/GNOME/fractal.git")
md5sums=('SKIP')

prepare() {
   cd "$_gitname"
   git tag -d 4.4.2-beta1 # upstream made a mistake and tagged this on main
}

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
