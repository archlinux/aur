# Maintainer: darkfm <darkfm@vera.com.uy>
pkgname=dingusppc-git
pkgver=r2432.c3448e1
pkgrel=1
pkgdesc="An experimental emulator"
arch=("x86_64")
url="https://github.com/dingusdev/dingusppc"
license=('GPL-3.0-only')
depends=('sdl2')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('dingusppc::git+https://github.com/dingusdev/dingusppc.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/dingusppc"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/dingusppc
    git submodule update --init --recursive
}

build() {
    cd $srcdir/dingusppc
    rm -rf build
    mkdir build
    cd build
    CFLAGS="$CFLAGS -Wno-format-security"
    CXXFLAGS="$CXXFLAGS -Wno-format-security"
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make dingusppc
}

package() {
    cd "$srcdir/dingusppc/build"
    mkdir -p $pkgdir/usr/bin
    make install
    mv dingusppc $pkgdir/usr/bin
}
