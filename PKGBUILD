# Maintainer: Yuki Ibe <yibe\100yibe\056org>
# Based on recutils package (https://aur.archlinux.org/packages/recutils/)
pkgname=recutils-git
pkgver=1.8.r26.gea03fda
pkgrel=1
pkgdesc="Set of tools and libraries to access plain text databases called recfiles."
arch=(i686 x86_64)
url="https://www.gnu.org/software/recutils/"
license=('GPL')
depends=('curl' 'libgcrypt')
makedepends=('git' 'help2man' 'rsync')
checkdepends=('check')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"git+https://git.savannah.gnu.org/git/recutils.git"
	"git+https://git.savannah.gnu.org/git/gnulib.git"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

prepare() {
	cd "${pkgname%-git}"
	git config submodule.gnulib.url ../gnulib
	git submodule update gnulib
	./bootstrap
}

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname%-git}"
	make -k check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
