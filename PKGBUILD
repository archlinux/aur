# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=eon
pkgver=2.16.0
pkgrel=1
pkgdesc="Algorithms for long timescales and PES exploration (EON)"
arch=('x86_64')
url='https://github.com/TheochemUI/EON'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'blas' 'cblas' 'lapack' 'python' 'python-numpy' 'python-yaml')
makedepends=(
  'meson' 'ninja' 'cmake' 'pkgconf' 'gfortran' 'git' 'rust' 'cargo'
  'eigen' 'blas' 'cblas' 'lapack' 'quill' 'cbindgen'
)
source=("$pkgname-v$pkgver.tar.xz::https://github.com/TheochemUI/EON/releases/download/v$pkgver/eon-v$pkgver.tar.xz")
sha256sums=('3d4da89a393c8821bf370cb97c9d2403718d83f9cbb5e8b918cd90af14ed52dc')

prepare() {
  cd "$srcdir"
  # quill via wrapdb if not provided by system pkg-config
  if ! pkg-config --exists quill 2>/dev/null; then
    mkdir -p subprojects
    if [[ ! -f subprojects/quill.wrap ]]; then
      cat > subprojects/quill.wrap << 'WRAP'
[wrap-file]
directory = quill-12.0.0
source_url = https://github.com/odygrd/quill/archive/refs/tags/v12.0.0.tar.gz
source_filename = quill-12.0.0.tar.gz
source_hash = 86974f76a2ca229460b027aed656ee9d3c5c1c5df70507448cb434d5e477d868

[provide]
dependency_names = quill
WRAP
    fi
  fi
}

build() {
  cd "$srcdir"
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
    --wrap-mode=default \
    -Dwith_fortran=true \
    -Dwith_cuh2=true \
    -Dwith_tests=false \
    -Dwith_xtb=false \
    -Dwith_metatomic=false \
    -Dwith_rgpot=false \
    -Dwith_serve=false \
    -Dwith_ase=false \
    -Dwith_mpi=false
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
  # drop subproject install artifacts; use standalone readcon-core package
  rm -f "$pkgdir/usr/include/readcon-core.h" \
        "$pkgdir/usr/share/pkgconfig/meson-readcon-core.pc" \
        "$pkgdir/usr/lib/libreadcon_core.a" 2>/dev/null || true
}
