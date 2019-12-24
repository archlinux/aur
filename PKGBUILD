# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nemo-ext-git-git
pkgver=1.3.r16.g5389549
pkgrel=2
pkgdesc="Nemo extension to add important information about the current git directory"
arch=('i686' 'x86_64')
url="https://github.com/bilelmoussaoui/nautilus-git"
license=('GPL3')
depends=('git' 'gobject-introspection' 'gtk3' 'nemo-python')
makedepends=('gnome-common' 'meson' 'intltool')
provides=("${pkgname%-git}" 'nemo-git')
conflicts=("${pkgname%-git}" 'nemo-git')
source=("${pkgname%-git}::git+https://github.com/bilelmoussaoui/nautilus-git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Disable post_install, not available in meson-options
	sed -i '37,38d' meson.build
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson builddir -Dfile_manager=nemo
	ninja -C builddir
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C builddir install
}
