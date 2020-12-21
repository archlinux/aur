# Maintainer: Ebrahim Byagowi <ebrahim@gnu.org>

pkgname=llvm-toolchain-nightly-bin
pkgver=12
pkgrel=1
pkgdesc="NOT READY YET. Precompiled binaries of llvm-toolchain (clang+lld+lldb+...) nightly builds. Status: Can't fetch llvm version."
arch=('x86_64')
url="https://llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=("libedit" "zlib") # TODO: check what it actually relies to by looking at control files
makedepends=('patchelf' 'wget')
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
    ln -s $f ${f::-3}
  done

  cd "$pkgdir/usr/lib/x86_64-linux-gnu"
  for f in *; do
    # TODO: a better way?
    ln -s $(readlink -f $f) ../$f
  done

  patchelf=(patchelf)
  patchelf+=(--replace-needed "libedit.so.2" "libedit.so")
  patchelf+=(--replace-needed "libz3.so.4" "libz.so")
  find "${pkgdir}/" -type f -not -name '*.py' -not -name '*.el' \
    -not -name '*.sh' -not -name '*.h' -not -path '*/usr/share/*' \
    -not -name '*.def' -not -name '*.td' -not -name '*.inc' \
    -not -path '*/utils/lit/*' -not -path '*/include/*' \
    -not -path '*/cmake/*' \
    -exec "${patchelf[@]}" {} \;
}
