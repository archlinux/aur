# Maintainer: Maciej Dziuban <dziuban.maciej@gmail.com>

pkgname=cmag
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive analyzer and browser for CMake build systems "
arch=('x86_64')
url="https://github.com/DziubanMaciej/cmag"
license=('MIT')
makedepends=('cmake' 'gcc' 'make')
_tag=560a1f7496966b4477e83423e5bdc7c57782d790 # git rev-parse v0.1.0
source=(git+https://github.com/DziubanMaciej/cmag.git#tag=$_tag)
sha256sums=('SKIP')

prepare() {
    _source_path="$srcdir/cmag"

    cd "$_source_path"
    git submodule update --init --recursive
}

build() {
    _source_path="$srcdir/cmag"
    _build_path="$srcdir/cmag/build"

    mkdir -p "$_build_path"
    cmake                          \
        -S "$_source_path"         \
        -B "$_build_path"          \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAG_BUILD_TESTS=OFF     \
        -DCMAG_BUILD_BROWSER=ON    \
        -DGLFW_BUILD_X11=ON        \
        -DGLFW_BUILD_WAYLAND=OFF
    cd "$_build_path"
    make
}

package() {
    _build_path="$srcdir/cmag/build"

    cd "$_build_path"
    make DESTDIR="$pkgdir/" install
}
