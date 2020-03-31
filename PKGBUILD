# Maintainer: Ilya Elenskiy <elenskiy.ilya@gmail.com>
# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocm-profiler
pkgver=3.1.0
pkgrel=2
pkgdesc="ROC profiler library. Profiling with perf-counters and derived metrics for GFX8/GFX9."
arch=('x86_64')
url="https://github.com/ROCm-Developer-Tools/rocprofiler"
license=('MIT')
depends=("hsa-rocr>=$pkgver")
makedepends=('cmake')
source=("https://github.com/ROCm-Developer-Tools/rocprofiler/archive/roc-$pkgver.tar.gz")
sha256sums=('5157d975563e04a207615811c611ee67253a1e02f2be2ecc369dc7dcfff60750')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DCMAKE_PREFIX_PATH=/opt/rocm \
        "$srcdir/rocprofiler-roc-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/rocprofiler.conf"
/opt/rocm/rocprofiler/lib
EOF
}
