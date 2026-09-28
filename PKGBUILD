# Maintainer: kekmacska

pkgname=leht-git
pkgver=0.1.0.r98.f337c02
pkgrel=1
pkgdesc='Fast, desktop-environment-neutral PDF toolkit for Linux'
arch=('any')
license=('AGPL-3.0')
url='https://github.com/mlkonrad/leht'
source=('git+https://github.com/mlkonrad/leht.git')
makedepends=(cmake make svgo pkgconf git libseccomp)
depends=(qt6-base 'openssl>=3.2' libp11-kit libglvnd libmupdf tesseract libarchive curl)
provides=(leht)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  cmake_version=$(sed -nE 's/^[[:space:]]*VERSION[[:space:]]+([0-9]+(\.[0-9]+)*)[[:space:]]*$/\1/p' CMakeLists.txt)
  echo "$cmake_version.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-*}"

    svgo . -r --multipass
}

build() {
    cd "${pkgname%-*}"

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-rtti \
            -fmerge-all-constants -ffunction-sections \
            -fdata-sections -fvisibility=hidden"

    BASE_CXXFLAGS="$BASE_CFLAGS"
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

    # Clang-only flags
    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
    CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
    CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

    # Detect compiler
    if command -v clang >/dev/null 2>&1; then
        export CC=clang
        export CXX=clang++
        export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
    else
        export CC=gcc
        export CXX=g++
        export CFLAGS="$BASE_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS"
    fi

    cmake -B build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_MANDIR=share/man \
        -DCMAKE_INSTALL_DATAROOTDIR=share \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_BINDIR=bin \
        -DLEHT_BUILD_UI=ON

    cmake --build build --parallel "$(nproc)"
}

package(){
    cd "$srcdir/${pkgname%-*}"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
