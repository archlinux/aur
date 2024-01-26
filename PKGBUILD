# Maintainer: Patrick Rogers <patrick@thewebzone.net>
pkgname=tschuss-git
_pkgname=tschuss
pkgver=r48.6ee14d8
pkgrel=1
pkgdesc="Simple and fast highly customizable dropdown power menu"
arch=('x86_64')
url="https://github.com/Lucad44/tschuss"
license=('MIT')
depends=('gtk3' 'libconfig' 'glib2' 'gdk-pixbuf2' 'glibc')
makedepends=('git' 'meson' 'ninja')
optdepends=('gtk-layer-shell')
install=$pkgname.install
provides=("tschuss")
conflicts=("tschuss")
source=('git+https://github.com/Lucad44/tschuss.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	meson setup build
	meson compile -C build
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 build/tschuss "$pkgdir/usr/bin/tschuss"
	install -Dm644 style.css "$pkgdir/etc/tschuss/style.css"
	# Replace .. in config file before installing
	sed -i 's|\.\.|/usr/share/tschuss|g' tschuss.conf
	install -Dm644 tschuss.conf "$pkgdir/etc/tschuss/tschuss.conf"
	# Create folder for default icons
	install -d "$pkgdir/usr/share/tschuss/icons/"
	install -Dm644 icons/* "$pkgdir/usr/share/tschuss/icons/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
