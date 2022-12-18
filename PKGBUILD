# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=cavalier-git
pkgver=2022.12.18.r0.g3030895
pkgrel=1
pkgdesc='Audio visualizer based on CAVA'
arch=(any)
url=https://github.com/fsobolev/${pkgname%-git}
license=(MIT)
depends=(cava libadwaita python-gobject)
makedepends=(git meson)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
b2sums=('SKIP')

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
	meson test -C build --print-errorlog
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 ${pkgname%-git}/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
