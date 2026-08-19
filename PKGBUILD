pkgname=rdopng-git
pkgver=1.0.9.r11.gdb77a33
pkgrel=1
pkgdesc="Rate-Distortion Optimized Lossy PNG/QOI Encoding Tool"
arch=('x86_64')
url="https://github.com/richgel999/rdopng"
license=('Apache-2.0')
makedepends=('git' 'cmake' 'make')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "${srcdir}/rdopng"

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing -fno-rtti -fno-exceptions \
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

  cmake .

  make -j"$(nproc)"
}

package() {
  cd "${srcdir}/rdopng"

  install -Dm755 "bin/rdopng" "${pkgdir}/usr/bin/rdopng"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
