# Submitter: Olaf Leidinger <oleid@mescharet.de>
# Maintainer: Jakub Okoński <jakub@okonski.org>
# Maintainer: Rigo Reddig <rigo.reddig@gmail.com> ;)
# Maintainer: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=hcc
pkgver=3.1.0
pkgrel=1
pkgdesc="HCC is an Open Source, Optimizing C++ Compiler for Heterogeneous Compute"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/hcc"
license=('custom:NCSAOSL')
depends=('rocr-runtime>=3.0.0' 'z3')
makedepends=('git' 'cmake')
options=(!staticlibs strip)
source=("hcc-roc-hcc-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/hcc/archive/roc-hcc-$pkgver.tar.gz"
        "llvm-project-roc-hcc-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/llvm-project/archive/roc-hcc-$pkgver.tar.gz"
        "ROCm-Device-Libs-roc-hcc-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/ROCm-Device-Libs/archive/roc-hcc-$pkgver.tar.gz")
sha256sums=('c9274230aa282e6ae90be5885e3f5b71b02153ca60980fc2122d61a5870bf2a2'
            'f76648116a2771a520545b9b5b3c931a8eb391f6f711f232924d92e8d1b43fc1'
            '42bd4f910dd44d6f0dd7bab7ebdadcf2e7cd4449ed7160dacc4471039584402c')

prepare() {
  cd "$srcdir"
  mv -T "llvm-project-roc-hcc-$pkgver" "hcc-roc-hcc-$pkgver/llvm-project"
  mv -T "ROCm-Device-Libs-roc-hcc-$pkgver" "hcc-roc-hcc-$pkgver/rocdl"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/hcc \
        -DLLVM_INSTALL_UTILS=TRUE \
        "$srcdir/hcc-roc-hcc-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in hcc hcc-config; do
    ln -s "/opt/rocm/hcc/bin/$fn" "$pkgdir/usr/bin/$fn"
  done

  # additional link to make hcc demos happy
  install -d "$pkgdir/opt/rocm/include"
  ln -s /opt/rocm/hcc/include "$pkgdir/opt/rocm/include/hcc"

  # additional link to make clang-ocl work
  ln -s /opt/rocm/hcc/bin "$pkgdir/opt/rocm/hcc/bin/x86_64"
}
