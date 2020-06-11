# Maintainer: Daniel Otero <otero (dot) o (dot) daniel (at) gmail (dot) com>
pkgname=nvptx-tools-git
pkgver=r61.5f6f343
pkgrel=1
pkgdesc="A collection of tools for use with nvptx-none GCC toolchains"
arch=('x86_64')
url="https://github.com/MentorEmbedded/nvptx-tools"
license=('GPL3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/MentorEmbedded/nvptx-tools.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# The code needs -O2 in the preprocessor flags to compile with _FORTIFY_SOURCE=2
	[[ $CPPFLAGS =~ "-D_FORTIFY_SOURCE=2" ]] && CPPFLAGS+=" -O2"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
