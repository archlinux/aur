# Maintainer: Daniel Otero <otero dot o dot daniel at gmail dot com>
# Maintainer: James Beddek <$(base64 --decode <<<'dGVsYW5zQHBvc3Rlby5kZQo=')>
pkgname=cvise
pkgver=2.7.0
pkgrel=1
pkgdesc="Super-parallel Python port of the C-Reduce"
arch=('x86_64')
url="https://github.com/marxin/cvise"
license=('custom:University of Illinois')
depends=(
	'clang>9.0.0'
	'flex'
	'llvm-libs>9.0.0'
	'python'
	'unifdef'
)
makedepends=(
	'git'
	'cmake'
	'llvm>9.0.0'
	'python-chardet'
	'python-pebble'
	'python-psutil'
)
checkdepends=(
	'python-pytest'
	'python-pytest-flake8'
)
optdepends=('colordiff')
source=("https://github.com/marxin/cvise/archive/v$pkgver.tar.gz")
sha256sums=('a0468bb16b99c9bc67b7cdd6557a79d441e5e1f253fdf7d73f21c15f9dc3b444')

prepare() {
	sed -i -e 's:-Werror::' -e '/CMAKE_CXX_FLAGS_REL/d' "$pkgname-$pkgver"/CMakeLists.txt
}

build() {
    cmake -B build -S "$pkgname-$pkgver" \
    	-DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBEXECDIR='/usr/lib' \
        -Wno-dev
    cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
