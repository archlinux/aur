# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Hoàng Văn Khải <hvksmr1996 at gmail dot com>
pkgname=dialect-git
pkgver=1.3.0.r41.gda1811a
pkgrel=1
pkgdesc="A translation app for GNOME."
arch=('any')
url="https://github.com/dialect-app/dialect"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject' 'python-googletrans' 'python-gtts'
         'python-httpx' 'gst-python')
makedepends=('meson' 'git' 'gobject-introspection')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnabel')
replaces=('gnabel-git')
source=('git+https://github.com/dialect-app/dialect.git'
        'git+https://github.com/dialect-app/po.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.po.url $srcdir/po
	git submodule update
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
