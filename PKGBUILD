# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=desktop-files-creator-git
pkgver=1.2.1.r0.g7a2615f
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url=https://github.com/alexkdeveloper/${pkgname%-git}
arch=(i686 x86_64 armv7h aarch64)
license=(GPL3)
depends=(libadwaita vala)
checkdepends=(appstream-glib)
makedepends=(git meson)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url.git)
b2sums=(SKIP)

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -i "s/'validate'/'validate-relax'/" ${pkgname%-git}/data/meson.build
}

build() {
	arch-meson ${pkgname%-git} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
