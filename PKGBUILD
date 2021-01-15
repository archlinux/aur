# Maintainer: Olivia Mackintosh <livvy@base.nu>
# Contributor: Bryce Chidester <bryce@cobryce.com>
pkgname=purple-matrix-git
pkgver=r207.1d23385
pkgrel=2
pkgdesc="Libpurple protocol plugin for matrix."
arch=('any')
url="https://github.com/matrix-org/purple-matrix"
license=('GPL2')
depends=('libpurple' 'http-parser' 'glib2' 'json-glib')
optdepends=('libolm: encryption support'
            'libgcrypt: encryption support')
makedepends=('git')
provides=('purple-matrix')
conflicts=('purple-matrix')
source=('git+https://github.com/matrix-org/purple-matrix.git')
md5sums=('SKIP')

CPPFLAGS="$CPPFLAGS -O2"

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	(pacman -Q libolm libgcrypt && make) || make MATRIX_NO_E2E=1
}


package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR=$pkgdir install
}
