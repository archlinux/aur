# Maintainer:  Joshua Holmer <jholmer.in@gmail.com>

pkgname=libjxl-metrics-git
pkgver=v0.3.7.777.g36ece47
pkgrel=1
pkgdesc="Image metrics (butteraugli and ssimulacra) maintained as libjxl tools"
arch=('any')
url='https://github.com/libjxl/libjxl'
license=('BSD-3')
depends=(
)
makedepends=('git'
'cmake'
)
provides=("libjxl-metrics")
conflicts=("libjxl-metrics")
source=("${pkgname}::git+https://github.com/libjxl/libjxl.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd ${pkgname}
  git submodule update --init --recursive --depth 1 --recommend-shallow
  mkdir -p build
}

build() {
  cd ${pkgname}
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DJPEGXL_ENABLE_DEVTOOLS=true -DJPEGXL_ENABLE_TOOLS=false \
    -DJPEGXL_ENABLE_BENCHMARK=false -DJPEGXL_ENABLE_FUZZERS=false -DJPEGXL_ENABLE_MANPAGES=false \
    -DJPEGXL_ENABLE_EXAMPLES=false -DJPEGXL_ENABLE_JNI=false -DJPEGXL_ENABLE_SJPEG=false \
    -DJPEGXL_ENABLE_OPENEXR=false -DJPEGXL_ENABLE_SKCMS=false -DJPEGXL_BUNDLE_SKCMS=false \
    -DJPEGXL_STATIC=true -DJPEGXL_ENABLE_TCMALLOC=false -DBUILD_TESTING=false ..
  cmake --build . -- -j$(nproc)
}

package() {
  cd ${pkgname}
  install -D -m755 "build/tools/butteraugli_main" "$pkgdir/usr/bin/butteraugli"
  install -D -m755 "build/tools/ssimulacra_main" "$pkgdir/usr/bin/ssimulacra"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
