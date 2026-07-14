# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=d-seams
_name=seams-core
pkgver=2.0.1
pkgrel=1
pkgdesc="d-SEAMS: deferred structural elucidation analysis for molecular simulations (C++ core)"
arch=('x86_64')
url='https://dseams.info'
license=('MIT')
depends=('gcc-libs' 'glibc' 'blas' 'cblas' 'lapack')
makedepends=('meson' 'ninja' 'cmake' 'pkgconf' 'git' 'eigen' 'blas' 'cblas' 'lapack')
optdepends=('highway: SIMD acceleration' 'openblas: optimized BLAS provider')
source=("$_name-$pkgver.tar.gz::https://github.com/d-SEAMS/seams-core/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88e1999c57d128ef6fb873a939214a85a6b71db74c7738074dcd7fd139388eeb')

prepare() {
  cd "$_name-$pkgver"
  # v2.0.1 floated vesin at main; pin to v0.5.7 (post-release fix on main).
  # Floating main pulls VerletList code without compiling verlet.cpp in the meson wrap.
  if [[ -f subprojects/vesin.wrap ]]; then
    sed -i 's/^revision = main$/revision = v0.5.7/' subprojects/vesin.wrap
  fi
}

build() {
  cd "$_name-$pkgver"
  # Arch Eigen may lack eigen3.pc; provide one if needed
  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:-}${PKG_CONFIG_PATH:+:}$srcdir"
  if ! pkg-config --exists eigen3 2>/dev/null; then
    cat > "$srcdir/eigen3.pc" << 'EPC'
prefix=/usr
includedir=${prefix}/include/eigen3
Name: Eigen3
Description: Eigen3 linear algebra
Version: 3.4.0
Cflags: -I${includedir}
EPC
  fi
  meson setup build \
    --prefix=/usr \
    --buildtype=plain \
    -Dwith_tests=false \
    -Dwith_python=false \
    --wrap-mode=default
  meson compile -C build
}

package() {
  cd "$_name-$pkgver"
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # drop subproject install artifacts; use standalone readcon-core package
  rm -f "$pkgdir/usr/include/readcon-core.h" \
        "$pkgdir/usr/share/pkgconfig/meson-readcon-core.pc" \
        "$pkgdir/usr/lib/libreadcon_core.a" 2>/dev/null || true
}
