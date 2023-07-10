# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Abigail Teague <ateague063@gmail.com>
pkgname=luaclasslib
pkgver=2.2.1
pkgrel=1
pkgdesc="Extends the Lua C API with Moonscript-compatible class support, with or without Moonscript"
arch=('x86_64')
url="https://github.com/mousebyte/luaclasslib"
license=('GPL')
depends=('lua')
makedepends=('cmake' 'git')
source=("https://github.com/mousebyte/luaclasslib/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "git+https://github.com/doctest/doctest.git")
md5sums=('24c5d4d6fb2fd0c284566ffe68317677'
         'SKIP')

prepare() {
    rm -r "$srcdir/$pkgname-$pkgver/doctest"
    ln -sf $srcdir/doctest "$pkgname-$pkgver/"
}

build() {
    # -O2 is specified for the Release build type in CMakeLists.txt
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
