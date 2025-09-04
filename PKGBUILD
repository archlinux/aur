# Maintainer: DanDucky <danducky2b@gmail.com>

pkgname=libnbtplusplus-git
pkgver=r305.531449b
pkgrel=1
pkgdesc="An nbt support library for C++"
url="https://github.com/PrismLauncher/libnbtplusplus"
arch=('x86_64')
license=('LGPL-3.0-only')
provides=("libnbtplusplus")
conflicts=("libnbtplusplus")

source=(
    "$pkgname::git+https://github.com/PrismLauncher/libnbtplusplus"
)
sha512sums=('SKIP')

depends=(
    'zlib'
)

makedepends=(
    'git'
    'cmake'
)

pkgver() {
    cd "$srcdir/$pkgname"
    
    # the CMakeLists.txt has a version number, but they don't update it always and I kind of need it to be updated
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    local cmake_options=(
        -B build
        -S $pkgname
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D NBT_BUILD_TESTS=OFF
        -D NBT_BUILD_SHARED=ON
        -D NBT_DEST_DIR=ON
        -D LIBRARY_DEST_DIR=/usr/lib
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    true
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -d "$pkgdir/usr/include"
    cp -r "$pkgname"/include/* "$pkgdir/usr/include/"
    install -Dm644 build/nbt_export.h "$pkgdir/usr/include/nbt_export.h"
}
