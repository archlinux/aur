# Maintainer: Felix Singer <felixsinger@posteo.net>

_gcc_targets="i386 x64 arm aarch64 riscv ppc64"
_is_clang_enabled=1
_commit='04bb74a7267a64d39ca87ba8c9b4f9f34c7d2bbb'

pkgbase='coreboot-toolchain'
pkgname=()
pkgver=24.08
pkgrel=1
pkgdesc='Used to build coreboot'
url='https://www.coreboot.org'
license=(BSD2 BSD3 GPL2 LGPL2Plus GPL3Plus)
arch=(x86_64 aarch64 riscv)
depends=() # TODO
makedepends=('gcc-ada' 'git') # TODO
options=('buildflags' '!debug')
source=(
  "git+https://review.coreboot.org/coreboot#commit=${_commit}"
  'https://downloadmirror.intel.com/783534/acpica-unix-20230628.tar.gz'
  'https://www.nasm.us/pub/nasm/releasebuilds/2.16.03/nasm-2.16.03.tar.bz2'
)
sha256sums=(
  'SKIP'
  '86876a745e3d224dcfd222ed3de465b47559e85811df2db9820ef09a9dff5cce'
  'bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57'
)
sources_gcc=(
  'https://ftpmirror.gnu.org/gmp/gmp-6.3.0.tar.xz'
  'https://ftpmirror.gnu.org/mpfr/mpfr-4.2.1.tar.xz'
  'https://ftpmirror.gnu.org/mpc/mpc-1.3.1.tar.gz'
  'https://ftpmirror.gnu.org/gcc/gcc-14.1.0/gcc-14.1.0.tar.xz'
  'https://ftpmirror.gnu.org/binutils/binutils-2.42.tar.xz'
)
hashes_gcc=(
  'a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
  '277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2'
  'ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8'
  'e283c654987afe3de9d8080bc0bd79534b5ca0d681a73a11ff2b5d3767426840'
  'f6e4d41fd5fc778b06b7891457b3620da5ecea1006c6a4a41ae998109f85a800'
)
sources_clang=(
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.6/lld-18.1.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.6/llvm-18.1.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.6/clang-18.1.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.6/cmake-18.1.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.6/compiler-rt-18.1.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.6/clang-tools-extra-18.1.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.6/libunwind-18.1.6.src.tar.xz'
  'https://cmake.org/files/v3.29/cmake-3.29.3.tar.gz'
)
hashes_clang=(
  'f1f059c2bf98ffa558cd0c48ea568736c41f0c8029dabb53147d48b9efdaa802'
  'c231d0a5445db2aafab855e052c247bdd9856ff9d7d9bffdd04e9f0bf8d5366f'
  '54e0817f918b90b5f94684e9729ac2f9d3820fce040d6395d71c1f19ffa3b03c'
  'a643261ed98ff76ab10f1a7039291fa841c292435ba1cfe11e235c2231b95cdb'
  'f05f4e15a4524194c93303aa6027006a5182eccfe8f5c90491c2f1fbfcedb96b'
  'd78732ec6d55b7374abe14b97c9529a7b56a1fe19929a5bf4c3802b69f77764e'
  '7ed4651612a5c07aadfda38fdbd4e7e786877826790b5d74ce30edd638eb00b3'
  '252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb'
)

for target in ${_gcc_targets}; do
  pkgname+=("${pkgbase}-gcc-${target}")
done

if [ ${_is_clang_enabled} -eq 1 ]; then
  pkgname+=("${pkgbase}-clang")
fi

if [ ${#_gcc_targets[@]} -ne 0 ]; then
  source+=("${sources_gcc[@]}")
  sha256sums+=("${hashes_gcc[@]}")
fi

if [ ${_is_clang_enabled} -eq 1 ]; then
  makedepends+=('python')
  source+=("${sources_clang[@]}")
  sha256sums+=("${hashes_clang[@]}")
fi

noextract=("${source[@]##*/}")


prepare() {
  tarballs="coreboot/util/crossgcc/tarballs"
  mkdir -p ${tarballs}
  for url in ${source[@]:1}; do
    filename="$(basename ${url})"
    ln -sf "$(pwd)/../${filename}" "${tarballs}/${filename}"
  done
}

build() {
  cd coreboot
  export CFLAGS=${CFLAGS/-Werror=format-security/}
  export CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  for target in ${_gcc_targets}; do
    make crossgcc-${target} CPUS=$(nproc) DEST="${srcdir}/gcc-${target}"
  done

  if [ ${_is_clang_enabled} -eq 1 ]; then
    for component in "clang iasl nasm"; do
      make ${component} CPUS=$(nproc) DEST="${srcdir}/clang"
    done
  fi
}

do_package_gcc() {
  target="$(echo ${pkgname} | cut -d '-' -f 4)"

  toolchain_dir="usr/${target}-coreboot-gcc"
  dest_path="${pkgdir}/${toolchain_dir}"
  mkdir -p ${dest_path}
  mv "${srcdir}/gcc-${target}"/* "${dest_path}"
}

do_package_clang() {
  toolchain_dir="usr/multiarch-coreboot-clang"
  dest_path="${pkgdir}/${toolchain_dir}"
  mkdir -p ${dest_path}
  mv ${srcdir}/clang/* "${dest_path}"/
}

package_coreboot-toolchain-gcc-i386() {
  do_package_gcc
}

package_coreboot-toolchain-gcc-x64() {
  do_package_gcc
}

package_coreboot-toolchain-gcc-arm() {
  do_package_gcc
}

package_coreboot-toolchain-gcc-aarch64() {
  do_package_gcc
}

package_coreboot-toolchain-gcc-riscv() {
  do_package_gcc
}

package_coreboot-toolchain-gcc-ppc64() {
  do_package_gcc
}

package_coreboot-toolchain-clang() {
  do_package_clang
}
