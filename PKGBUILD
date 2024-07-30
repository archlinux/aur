# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=compiano-git
pkgver=r223.ebdde61
pkgrel=2
pkgdesc="a midi controllable software musical instrument"
arch=('x86_64')
url="https://gitlab.gnome.org/hub/compiano.git"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'alsa-lib' 'libgit2' 'libpanel')
makedepends=('git' 'ninja' 'meson' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url" "git+https://gitlab.gnome.org/hub/libpanel-rs.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
 cd "$srcdir/${pkgname%-git}"
 git submodule init
 git config submodule.crates/libpanel-rs.url "$srcdir/libpanel-rs"
 git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson --prefix=/usr "." "build"
	meson compile -C "build"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	meson install -C "build" --destdir "$pkgdir"
}
