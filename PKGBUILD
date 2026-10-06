# Maintainer: kekmacska

pkgname=syrinc-git
pkgver=r26.g0b1052baf
pkgrel=1
pkgdesc='audio file handler which lets you embed, format and convert lyrics data to your favorite songs, to make them display and move along in your music player'
arch=('any')
license=('GPL-3.0')
url='https://github.com/techmanwalker/syrinc'
source=("git+$url.git")
makedepends=(cmake make pkgconf git cxxopts)
depends=(ffmpeg libstdc++)
provides=("${pkgname%-*}")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-*}

    # 2. Get git info
    commits=$(git rev-list --count HEAD)
    commit=$(git rev-parse --short=9 HEAD)

    # 3. Print result
    printf 'r%s.g%s\n' "$commits" "$commit"
}

build() {
    cd ${pkgname%-*}

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing \
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

    cmake -B build -DCMAKE_BUILD_TYPE=Release

    cmake --build build --parallel "$(nproc)"
}

package(){
    cd "$srcdir/${pkgname%-*}"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
