# Maintainer: FloofyPlasma <aur@floofyplasma.com>
# Contributor: Julia DeMille <me@jdemille.com>
pkgname=libobjc2
pkgver=2.3
_majorver=${pkgver%%.*}
_commit=v2.3
pkgrel=1
pkgdesc="Objective-C runtime library intended for use with Clang."
arch=("x86_64" "i686" "aarch64")
url="https://github.com/gnustep/libobjc2"
license=("MIT")
depends=(gcc-libs glibc)
makedepends=(cmake clang git)
provides=(libobjc2)
conflicts=(libobjc2)
source=(
    "$pkgname::git+${url}.git#commit=${_commit}"
)
b2sums=('SKIP')

cmake_gen() {
    if hash ninja 2>/dev/null; then
        echo "Ninja"
    else
        echo "Unix Makefiles"
    fi
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cmake -B build -S "$pkgname" -G"$(cmake_gen)" -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -Wno-dev \
        -DCMAKE_C_COMPILER=clang -DCMAKE_OBJC_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_OBJCXX_COMPILER=clang++ -DTESTS=NO \  # Tests don't build right.
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
