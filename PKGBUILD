# Maintainer: Gustavo Ramos Rehermann <gr.wallabra@proton.me>
pkgname=fiqhack-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=4.3.0.r677.dc309067
pkgrel=1
pkgdesc="Variant of NetHack focused on AI, balance, and interface improvements"
arch=(x86_64)
url=""
license=('GPL')
groups=()
depends=(jansson libpng sdl2)
makedepends=(git)
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('fiqhack::git+https://github.com/FredrIQ/fiqhack' 00-change-makefile-paths.patch)
noextract=()
sha256sums=('SKIP'
            '889601fe83d9005a8fa4f0b27e4e8dac767eba289ed0b29c352a698feb27dd69')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/00-change-makefile-paths.patch"
}

build() {
	cd "$srcdir"
	mkdir build 2>/dev/null || true
	cd build

	DESTDIR="$pkgdir/usr/local" make -C "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/build"
	DESTDIR="$pkgdir/usr/local" make -C "$srcdir/${pkgname%-git}" install
	sudo chmod -Rv 777 "$pkgdir/var/games/fiqhack/save"
}
