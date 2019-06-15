# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Matt Coffin <mcoffin13 at gmail.com>

pkgname=bzip2-rustify-git
pkgver=r60.25f6f5f
pkgrel=1
pkgdesc="A parallel, SMP-based, bzip2-compatible compression utility (rustify branch)"
arch=('i686' 'x86_64')
url="http://lbzip2.org/"
license=('GPL3')
depends=('glibc')
makedepends=('perl' 'git' 'make' 'autoconf' 'autoconf-archive' 'cargo')
provides=('bzip2')
conflicts=('bzip2')

_gitname="bzip2"
source=($_gitname'::git+https://gitlab.com/federicomenaquintero/bzip2.git#branch=rustify')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	if [ ! -x ./configure ]; then
		./autogen.sh # Rustify branch doesn't have ./configure committed
	fi
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$_gitname"
	pushd bzlib_rust > /dev/null
	cargo test --release
	popd > /dev/null
	# TODO: meson build system has meson test. I need to find out what this is for the autoconf build system
}

package() {
	cd "$srcdir/$_gitname"
	DESTDIR="$pkgdir" make install

	# For some reason, the installer doesn't symlink libbz2.so.1.0
	cd "$pkgdir/usr/lib"
	if [ ! -e libbz2.so.1.0 ]; then
		ln -s libbz2.so.1 libbz2.so.1.0
	fi
}
