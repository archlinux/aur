# Maintainer: Your Name <youremail@domain.com>
pkgname=hashclash-git
pkgver=r45.c1159e9
pkgrel=2
pkgdesc="Project HashClash - MD5 & SHA-1 cryptanalysis "
arch=(x86_64)
url="https://github.com/cr-marcstevens/hashclash"
license=('MIT')
depends=(boost-libs)
makedepends=('git' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/cr-marcstevens/hashclash"
		"cuda.patch")
md5sums=('SKIP'
         'e50c821804f404ed10ccecc790382f8f')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 < "$srcdir/cuda.patch"
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -D "$srcdir/${pkgname%-git}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
