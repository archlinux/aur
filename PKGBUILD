pkgname=jm-git
pkgver=19.1.r10.g8b34eee
pkgrel=1
pkgdesc="JM H.264 reference encoder/decoder, development build"
arch=('x86_64')
url="https://vcgit.hhi.fraunhofer.de/jvet/JM"
license=('ITU')
depends=('openmp')
makedepends=('cmake' 'make')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/JM"
  git describe --long --tags | sed -r 's/^JM-//;s/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd "$srcdir/JM"
  sed -i 's/warnings-as-errors//g' CMakeLists.txt
}

build() {
  cd "$srcdir/JM"

  mkdir -p build
  cd build

  BASE_CFLAGS="-O3 -march=native -mtune=native \
          -falign-functions=32 -falign-loops=32 \
          -fno-math-errno -fno-trapping-math \
          -fno-semantic-interposition \
          -fomit-frame-pointer -fno-plt \
          -pipe -flto -Wall -Wno-unused \
          -fstrict-aliasing -fno-rtti -fno-exceptions \
          -fmerge-all-constants -ffunction-sections \
          -fdata-sections -fvisibility=hidden \
          -Wno-unused-variable \
          -Wno-unused-but-set-variable -Wno-uninitialized \
          -Wno-implicit-const-int-float-conversion \
          -Wno-misleading-indentation"

  BASE_CXXFLAGS="$BASE_CFLAGS"
  BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

  CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
  CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
  CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

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

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_STATIC=OFF \
    -DSET_ENABLE_SPLIT_PARALLELISM=ON \
    -DENABLE_SPLIT_PARALLELISM=ON \
    -DSET_ENABLE_WPP_PARALLELISM=ON \
    -DENABLE_WPP_PARALLELISM=ON

  make -j"$(nproc)"
}

package() {
  cd "$srcdir/JM"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  # install binaries from any compiler/arch/release folder
  find bin/umake -type f -executable -exec install -m755 {} "$pkgdir/usr/bin/" \;

  # Merge licenses
  cat COPYRIGHT_ITU.txt COPYRIGHT_ISO_IEC.txt > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
