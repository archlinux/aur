# Maintainer: ARKye03 <rafa03-dev@proton.me>

pkgname=icon-browser-git
pkgver=r25.c211573 # Can't be empty, will be set dynamically
pkgrel=1
pkgdesc="Browse system installed icon themes"
arch=(x86_64)
license=('MIT')
url="https://github.com/Aylur/icon-browser"
depends=(
	gtk4
	glib2
	gjs
	libadwaita
)
makedepends=(
	git
	gobject-introspection
	meson
	ninja
	nodejs
	pnpm
	desktop-file-utils
)
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$pkgname" || exit
	# Upstream sets Exec to a relative bin/ path; binary is in $PATH
	sed -i "s|'EXEC': bindir / meson.project_name()|'EXEC': meson.project_name()|" meson.build
}

build() {
	cd "$pkgname" || exit
	pnpm install --frozen-lockfile
	arch-meson --prefix /usr build
	meson compile -C build
}

package() {
	cd "$pkgname" || exit
	meson install -C build --destdir "$pkgdir"
}
