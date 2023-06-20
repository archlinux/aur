# Contributor: éclairevoyant
# Contributor: Kyle Keen <keenerd at gmail dot com>

_pkgname=fexl
pkgname="$_pkgname-git"
pkgver=27.18.0.r12.83e9b05
pkgrel=1
epoch=1
pkgdesc="Simple but powerful functional scripting language"
arch=(i686 x86_64)
url="https://fexl.com/"
license=(MIT)
depends=(glibc)
makedepends=(git)
source=("$_pkgname::git+https://github.com/chkoreff/Fexl")
b2sums=('SKIP')

prepare() {
	cd $_pkgname/src
	# test scripts and reference outputs use hardcoded relative paths
	# strangely, a1 already has the desired path, so we only fix the other tests.
	sed -i 's|\.\./bin/||g;s|test/|src/test/|g;s|out/|src/out/|g' \
		test/{check,show,stream}.fxl out/{a7,b14,missing,lib}
}

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname/src
	./build
}

check() {
	cd $_pkgname
	# b17 fails, not sure why
	PATH="./bin:$PATH" fexl src/test/check.fxl
}

package() {
	cd $_pkgname
	install -Dm755 bin/$_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
