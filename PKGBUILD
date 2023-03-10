pkgname=fractal-next-git
_gitname=fractal
epoch=1
pkgver=5.alpha.r964.012b9856
pkgrel=1
pkgdesc="Matrix messaging app for GNOME written in Rust"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/GNOME/fractal"
depends=('gtk4' 'gtksourceview5' 'gst-plugins-base-libs' 'gst-editing-services' 'gspell' 'libadwaita' 'pipewire' 'libshumate' 'org.freedesktop.secrets')
conflicts=('fractal')
provides=("fractal=$pkgver" 'fractal-next')
replaces=('fractal')
makedepends=('rust' 'git' 'meson' 'clang')
source=("git+https://gitlab.gnome.org/GNOME/fractal.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	(
		set -o pipefail

		# the -next rewrite is a completely separate git history, which does not have any tags yet
		printf "5.alpha.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_gitname}/"
	arch-meson . _build
}

package() {
	cd "${srcdir}/${_gitname}/"
	DESTDIR="${pkgdir}" ninja -C _build install
}
