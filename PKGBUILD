# Maintainer: Julia DeMille <me@jdemille.com>
pkgname=libobjc2
pkgver=2.1
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
    "$pkgname::git+${url}.git#tag=v$pkgver"
    "fix_eh_trampoline.patch::${url}/commit/365e53632e8be41e49f21ee47a63e41be424a237.patch"
)
b2sums=('SKIP'
        '51c42a36f14ad1470f2c65e1c18a3dce93f4360a0081cf6ce8d4b559f839e942b401e9f61cfe1733aebeb5f3341f89d4ea6e25d7e6e27cbd5a527de5edf38baa')

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
    git apply "$srcdir/fix_eh_trampoline.patch"
}

build() {
    cmake -B build -S "$pkgname" -G"$(cmake_gen)" -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -Wno-dev \
        -DCMAKE_C_COMPILER=clang -DCMAKE_OBJC_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_OBJCXX_COMPILER=clang++ -DTESTS=NO # Tests don't build right.
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
