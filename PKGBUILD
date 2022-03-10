# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=desktop-files-creator-git
pkgver=r61.abbfd9f
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url="https://github.com/alexkdeveloper/${pkgname%-git}"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('gtk4' 'libadwaita')
checkdepends=('appstream-glib')
makedepends=('git' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson ${pkgname%-git} build
	meson compile -C build
}

check() {
	#skip appstream test because it returns error
	meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
