# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-runtime-git
pkgver=1
pkgrel=1
pkgdesc="C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
url="https://gitlab.com/inivation/dv/${pkgname%-git}/"
license=('AGPL3')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('libcaer-git' 'boost' 'openssl' 'opencv' 'gperftools' 'sfml' 'libx11'  'lz4' 'zstd' 'fmt')
makedepends=('git' 'cmake' 'pkgconf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
source=("$pkgname::git+https://gitlab.com/inivation/dv/${pkgname%-git}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TCMALLOC=1 -DENABLE_VISUALIZER=1 .

	make
}

package() {
	cd "$srcdir/$pkgname"

	DESTDIR="$pkgdir/" make install

	cd "$pkgdir"

	# Fix systemd directory due to symlinks
	mv lib/systemd/ usr/lib/
	rm -Rf lib/
}
