# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocprofiler
pkgver=5.0.2
pkgrel=1
pkgdesc="ROC profiler library. Profiling with perf-counters and derived metrics."
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Tools/ROCm-Tools.html'
license=('MIT')
depends=('hip' 'python')
makedepends=('cmake' 'python-argparse' 'python-cppheaderparser')
options=(!staticlibs strip)
_git='https://github.com/ROCm-Developer-Tools/rocprofiler'
_roctracer='https://github.com/ROCm-Developer-Tools/roctracer'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/refs/tags/rocm-$pkgver.tar.gz"
        "$pkgname-roctracer-$pkgver.tar.gz::$_roctracer/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('48f58c3c16dd45fead2086f89a175f74636e81bc2437e30bb6e9361b1083e71d'
            '5ee46f079e57dfe491678ffa4cdaf5f3b3d179cb3137948e4bcafca99ded47cc')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"
_dirtracer="$(basename "$_roctracer")-$(basename "${source[1]}" ".tar.gz")"

build() {
  cmake -B build -Wno-dev \
        -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DPROF_API_HEADER_PATH="$srcdir/$_dirtracer/inc/ext"

  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/rocm/rocprofiler/bin/rocprof" "$pkgdir/usr/bin/rocprof"

  install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
