# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_plug=julek
pkgname=vapoursynth-plugin-$_plug-git
pkgver=r3.3.7674578
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
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
provides=(
  vapoursynth-plugin-$_plug
)
conflicts=(
  vapoursynth-plugin-$_plug
)
source=(
  $_plug::git+$url.git
  git+https://github.com/libjxl/libjxl.git
  git+https://github.com/google/highway.git
  git+https://skia.googlesource.com/skcms.git
)
sha256sums=(
  SKIP
  SKIP
  SKIP
  SKIP
)

pkgver() {
  cd $_plug
  git describe --tags --long | tr - . | tr -d g
}

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
  export CC=clang CXX=clang++
  export LDFLAGS+=' -fuse-ld=lld'
  cmake \
    -S $_plug/thirdparty/libjxl \
    -B $_plug/thirdparty/libjxl_build \
    -C $_plug/thirdparty/libjxl_cache.cmake \
    -DJPEGXL_ENABLE_DOXYGEN=OFF \
    -DJPEGXL_ENABLE_JPEGLI=OFF \
    -DJPEGXL_FORCE_SYSTEM_BROTLI=ON \
    -G Ninja
  cmake --build $_plug/thirdparty/libjxl_build
  cmake --install $_plug/thirdparty/libjxl_build

  cmake \
    -S $_plug \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -G Ninja
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_plug/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
