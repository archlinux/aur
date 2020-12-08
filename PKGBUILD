# Maintainer: Ebrahim Byagowi <ebrahim@gnu.org>

pkgname=llvm-toolchain-nightly-bin
pkgver=12
pkgrel=1
pkgdesc="Precompiled binaries of llvm-toolchain (clang+lld+lldb+...) nightly builds"
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=() # TODO: check what it actually relies to by looking at control files
makedepends=('wget')
provides=("clang-analyzer=$pkgver" "clang-tools-extra=$pkgver"
          "clang=$pkgver" "lld=$pkgver" "llvm=$pkgver"
          "compiler-rt=$pkgver" "polly=$pkgver"
          "lldb=$pkgver" "openmp=$pkgver")
source=()
sha256sums=()

package() {
  wget --mirror --no-directories --no-parent --compress=auto \
    --reject="index.html*" --reject="*-dbgsym_*" \
    --reject="*_i386*" --reject="*_arm*" \
    --reject="*.tar.xz" --reject="*.dsc" \
    --reject="*ocaml*" \
    https://apt.llvm.org/unstable/pool/main/l/llvm-toolchain-snapshot/
  for f in *.deb; do
    ar xv $f
    tar xf data.tar.xz -C "${pkgdir}"
    rm debian-binary control.tar.xz data.tar.xz
  done

  cd "$pkgdir/usr/bin"
  for f in *-$pkgver; do
    echo "Link" $f "to" ${f::-3}
    ln -s $f ${f::-3}
  done
}
