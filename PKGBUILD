# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_plug=julek
pkgname=vapoursynth-plugin-$_plug
pkgver=r3
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=(x86_64)
url=https://github.com/dnjulek/vapoursynth-julek-plugin
license=(MIT)
depends=(
  vapoursynth
  brotli
  gperftools
)
makedepends=(
  git
  cmake
  clang
  lld
  ninja
  python
  asciidoc
)
source=(
  $_plug::git+$url.git#tag=$pkgver
  git+https://github.com/libjxl/libjxl.git#tag=v0.11.1
  git+https://github.com/google/highway.git#tag=1.2.0
  git+https://skia.googlesource.com/skcms.git#commit=b2e692629c1fb19342517d7fb61f1cf83d075492
)
sha256sums=(
  SKIP
  SKIP
  SKIP
  SKIP
)

prepare() {
  cd $_plug
  git submodule init thirdparty/libjxl
  git config submodule.thirdparty/libjxl.url "$srcdir/libjxl"
  git -c protocol.file.allow=always submodule update
  mkdir -p thirdparty/libjxl_build
  cd thirdparty/libjxl
  git submodule init third_party/{highway,skcms}
  git config submodule.third_party/highway.url "$srcdir/highway"
  git config submodule.third_party/skcms.url "$srcdir/skcms"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_plug
  export CC=clang CXX=clang++
  export LDFLAGS+=' -fuse-ld=lld'

  cmake \
    -S thirdparty/libjxl \
    -B thirdparty/libjxl_build \
    -C thirdparty/libjxl_cache.cmake \
    -DJPEGXL_ENABLE_DOXYGEN=OFF \
    -DJPEGXL_ENABLE_JPEGLI=OFF \
    -DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
    -G Ninja
  cmake --build thirdparty/libjxl_build
  cmake --install thirdparty/libjxl_build

  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -G Ninja
  cmake --build build
}

package() {
  cd $_plug
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
