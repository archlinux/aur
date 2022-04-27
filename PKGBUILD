# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=dynamic-wallpaper-git
pkgver=0.0.1.r2.g20101d1
pkgrel=1
pkgdesc='Dynamic wallpaper maker for Gnome 42'
url='https://github.com/dusansimic/dynamic-wallpaper'
arch=('any')
license=('GPL2')
depends=('gtk4' 'libadwaita' 'python3')
makedepends=('meson' 'git')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git" 'appstream.patch')
sha256sums=('SKIP'
            'ea0e228a0ea4047d24a333f0e4281f183c0382ae29ef04f96be3b4683dea65db')

pkgver() {
	cd ${pkgname%-git}
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${pkgname%-git}
	patch -p1 -i "$srcdir"/appstream.patch
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
