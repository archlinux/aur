# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=paper-git
pkgver=r39.2b472c3
pkgrel=1
pkgdesc="A pretty note-taking app for GNOME"
arch=('x86_64')
url="https://gitlab.com/posidon_software/paper"
license=('GPL3')
depends=('glib2' 'libadwaita' 'gtksourceview5' 'libgee')
makedepends=('git' 'meson' 'gobject-introspection' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${pkgname%-git}"
	
	mv data/markdown.lang data/paper_markdown.lang
	
	sed -i 's/markdown.lang/paper_markdown.lang/g' \
    data/meson.build
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
