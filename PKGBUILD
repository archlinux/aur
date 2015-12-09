# Contributor: Thomas Brix Larsen <brix@brix-verden.dk>

pkgname=kdevelop-dlang-git
pkgver=r37.79c7789
pkgrel=1
pkgdesc="D language plugin for KDevelop - Git build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevplatform>=4.90.90' 'kdevelop>=4.90.90' 'ldc>=0.16.1')
makedepends=('cmake' 'automoc4' 'git' 'ldc>=0.16.1')
source=('git+https://github.com/ThomasBrixLarsen/kdev-dlang.git'
        'git+https://github.com/ThomasBrixLarsen/libdparse.git')
provides=('kdevelop-dlang')
conflicts=('kdevelop-dlang')
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/kdev-dlang"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/kdev-dlang"
    git submodule init
    git config submodule.libdparse.url $srcdir/libdparse
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/kdev-dlang"

    cd parser
    ./build.sh
    cd ..

    mkdir -p "$srcdir/kdev-dlang/build"
    cd "$srcdir/kdev-dlang/build"

    cmake ../ \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

    make
}

package() {
    cd "$srcdir/kdev-dlang/build"

    make DESTDIR="$pkgdir/" install
}
