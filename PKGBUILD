# Maintainer: Eduardo Sánchez Muñoz

pkgname=cling-git
pkgver=r2531.5842d86
pkgrel=1
pkgdesc="Interactive C++ interpreter built on the top of LLVM and Clang libraries."
arch=('i686' 'x86_64')
url="https://root.cern.ch/drupal/content/cling"
license=('custom:Cling Release License')
depends=('libffi')
makedepends=('libffi' 'clang' 'git' 'python2' 'make')
options=()
conflicts=()
provides=()
source=("llvm::git+http://root.cern.ch/git/llvm.git#branch=cling-patches"
	"clang::git+http://root.cern.ch/git/clang.git#branch=cling-patches"
	"cling::git+http://root.cern.ch/git/cling.git#branch=master")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/cling"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	if [ ! -h "$srcdir/llvm/tools/clang" ]; then
		ln -s "$srcdir/clang" "$srcdir/llvm/tools/clang"
	fi
	
	if [ ! -h "$srcdir/llvm/tools/cling" ]; then
		ln -s "$srcdir/cling" "$srcdir/llvm/tools/cling"
	fi
}

build() {
	cd "$srcdir"
	
	rm -rf "$srcdir/cling-build"
	mkdir -p "$srcdir/cling-build"
	cd "$srcdir/cling-build"
	
	CPPFLAGS+=" $(pkg-config --cflags libffi)"
	
	"$srcdir/llvm/configure" \
		--prefix="/opt/cling" \
		--sysconfdir=/etc \
		--enable-cxx11 \
		--enable-libffi \
		--with-python=python2 \
		--enable-targets=host \
		--enable-bindings=none \
		--enable-optimized \
		--disable-expensive-checks \
		--disable-debug-runtime \
		--disable-assertions
	make
}

package() {
	cd "$srcdir/cling-build"
	make DESTDIR="$pkgdir" install
	
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/cling/bin/cling" "$pkgdir/usr/bin/cling"
	install -Dm644 "$srcdir/llvm/tools/cling/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
