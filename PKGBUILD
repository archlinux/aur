# Maintainer: Josh Holmer <jholmer.in@gmail.com>

pkgname=aom-psy-git
pkgver=r32859.gc7ecd15af
pkgrel=1
pkgdesc="An open, royalty-free video coding format, includes tune=(vmaf|butteraugli) and BlueSwordM's psy patches"
arch=('i686' 'x86_64')
url="https://aomedia.org/"
license=('BSD' 'custom:PATENTS')
depends=('gcc-libs' 'vmaf' 'libjxl-metrics-git')
makedepends=('git' 'cmake' 'doxygen' 'graphviz' 'perl' 'yasm' 'clang' 'lld')
optdepends=('aocc: AMD Optimizing Compiler')
provides=('aom' 'aom-git' 'libaom.so')
conflicts=('aom' 'aom-git')
source=("git+https://gitlab.com/shssoichiro/aom.git#branch=patched")
sha256sums=('SKIP')

pkgver() {
  cd "aom"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "aom"
  export LDFLAGS="-fuse-ld=lld -Wl,--thinlto-jobs=all"
  COMMON_FLAGS="-O3 -march=native -flto=thin -pipe"
  export CC=clang CXX=clang++
  export CFLAGS="${COMMON_FLAGS}" CXXFLAGS="${COMMON_FLAGS}"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_C_COMPILER="${CC}" \
    -DCMAKE_CXX_COMPILER="${CXX}" \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
    -DAOM_EXTRA_C_FLAGS="${CFLAGS}" \
    -DAOM_EXTRA_CXX_FLAGS="${CXXFLAGS}" \
    -DAOM_EXTRA_EXE_LINKER_FLAGS="${LDFLAGS}" \
    -DBUILD_SHARED_LIBS=1 \
    -DENABLE_TESTS=0 \
    -DENABLE_EXAMPLES=1 \
    -DCONFIG_AV1_ENCODER=1 \
    -DCONFIG_AV1_DECODER=1 \
    -DCONFIG_TUNE_VMAF=1 \
    -DCONFIG_TUNE_BUTTERAUGLI=1 \
    -DCONFIG_THREE_PASS=0 \
    ./
  make -C "_build"
}

package() {
  cd "aom"

  make -C "_build" DESTDIR="$pkgdir" install
  cp "_build/examples/photon_noise_table" "$pkgdir/usr/bin/photon_noise_table"
  cp "_build/examples/noise_model" "$pkgdir/usr/bin/noise_model"

  install -d "$pkgdir/usr/share/doc/aom"
  cp -R "_build/docs/." "$pkgdir/usr/share/doc/aom"

  install -Dm644 {LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/aom"
}
