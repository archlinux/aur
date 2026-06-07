pkgname=sjpeg-git
pkgver=r330.46da5ae
pkgrel=1
pkgdesc="SJPEG image encoder with PNG, JPEG, and OpenGL support"
arch=('x86_64')
url="https://github.com/webmproject/sjpeg"
license=('Apache-2.0')

depends=('libpng' 'libjpeg-turbo' 'glibc' 'freeglut' 'mesa')
makedepends=('clang' 'lld' 'make' 'freeglut' 'mesa' 'libpng' 'libjpeg-turbo')

source=("sjpeg::git+https://github.com/webmproject/sjpeg")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sjpeg"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sjpeg"

  make clean || true
  find . -name "*.o" -delete

  make -j"$(nproc)" \
    CXX=clang++ \
    HAVE_SSE41=1 \
    HAVE_AVX2=1 \
    EXTRA_FLAGS="-DSJPEG_HAVE_PNG -DSJPEG_HAVE_JPEG -DSJPEG_HAVE_OPENGL \
                 -std=c++11 \
                 -O3 -march=native -mtune=native \
                 -funroll-loops \
                 -falign-functions=32 \
                 -falign-loops=32 \
                 -fno-math-errno \
                 -fno-trapping-math \
                 -fno-semantic-interposition \
                 -fomit-frame-pointer \
                 -fno-plt \
                 -flto \
                 -Wextra -Wunused -Wshadow \
                 -Wformat-security -Wformat-nonliteral" \
    LDFLAGS="-fuse-ld=lld -flto -ljpeg -lpng -lGL -lglut -lpthread -lm"
}

package() {
  cd "$srcdir/sjpeg"

  # binaries
  install -Dm755 examples/sjpeg "$pkgdir/usr/bin/sjpeg"
  #install -Dm755 examples/vjpeg "$pkgdir/usr/bin/vjpeg" doesnt work

  # headers
  install -Dm644 src/sjpeg.h "$pkgdir/usr/include/sjpeg/sjpeg.h"

  # static library
  install -Dm644 src/libsjpeg.a "$pkgdir/usr/lib/libsjpeg.a"
}
