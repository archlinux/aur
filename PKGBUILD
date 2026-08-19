pkgname=sjpeg-git
pkgver=r353.bfdb140
pkgrel=1
pkgdesc="SJPEG image encoder (alternative jpeg encoder)"
arch=('x86_64')
url="https://github.com/webmproject/sjpeg"
license=('Apache-2.0')
depends=('libpng' 'libjpeg-turbo' 'glibc' 'freeglut' 'mesa')
makedepends=('make' 'freeglut' 'mesa' 'libpng' 'libjpeg-turbo')
source=("sjpeg::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sjpeg"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sjpeg"

  # Base flags
  BASE_CFLAGS="-O3 -march=znver4 -mtune=znver4 \
                -falign-functions=32 -falign-loops=32 \
                -fno-math-errno -fno-trapping-math \
                -fno-semantic-interposition \
                -fomit-frame-pointer -fno-plt \
                -pipe -flto -Wall -Wno-unused \
                -fstrict-aliasing -fno-rtti -fno-exceptions \
                -fmerge-all-constants -ffunction-sections \
                -fdata-sections -fvisibility=hidden \
                -Wextra -Wunused -Wshadow \
                -Wformat-security -Wformat-nonliteral \
                -DSJPEG_HAVE_PNG -DSJPEG_HAVE_JPEG -DSJPEG_HAVE_OPENGL \
                -std=c++11"

  BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt \
                -ljpeg -lpng -lGL -lglut -lpthread -lm"

  # Clang-only flags
  CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
  CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

  # Detect compiler
  if command -v clang >/dev/null 2>&1; then
      EXTRA_FLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
      LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
      CC_BIN=clang
      CXX_BIN=clang++
  else
      EXTRA_FLAGS="$BASE_CFLAGS"
      LDFLAGS="$BASE_LDFLAGS"
      CC_BIN=gcc
      CXX_BIN=g++
  fi

  make -j"$(nproc)" \
      CC="$CC_BIN" \
      CXX="$CXX_BIN" \
      HAVE_SSE41=1 \
      HAVE_AVX2=1 \
      EXTRA_FLAGS="$EXTRA_FLAGS" \
      LDFLAGS="$LDFLAGS"
}

package() {
  cd "$srcdir/sjpeg"

  # binaries
  install -Dm755 examples/sjpeg "$pkgdir/usr/bin/sjpeg"
  #install -Dm755 examples/vjpeg "$pkgdir/usr/bin/vjpeg" doesnt work

  # headers
  install -Dm644 src/sjpeg.h "$pkgdir/usr/include/sjpeg/sjpeg.h"
}
