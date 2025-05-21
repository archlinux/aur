# Maintainer: Maiko Tan <maiko.tan.coding@gmail.com>
pkgname=bytelizer-git
pkgver=r25.b092f21
pkgrel=1
pkgdesc="Bytelizer is a binary packaging/unpack library written in modern c, focusing on performance and lightweight."
arch=(any)
url="https://github.com/TheSnowfield/bytelizer"
license=('GPL-2.0-only')
groups=()
depends=()
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-*=$pkgver}")
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
install=
source=($pkgname::git+https://github.com/TheSnowfield/bytelizer.git)
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	cmake -B build -DBUILD=lib
	cd build
	make
}

package() {
	cd "$srcdir/${pkgname}/build"
	install -Dm644 libbytelizer.so "$pkgdir/usr/lib/libbytelizer.so"
	install -Dm644 libbytelizer_static.a "$pkgdir/usr/lib/libbytelizer_static.a"
	install -d "$pkgdir/usr/include/bytelizer/"
	for f in $srcdir/$pkgname/src/*.h; do \
		install -Dm644 -t "$pkgdir/usr/include/bytelizer/" $f; \
	done
	install -Dm444 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
