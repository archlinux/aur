# Maintainer: Felix Singer <felixsinger@posteo.net>

_gcc_targets="i386 x64 arm aarch64 riscv ppc64 nds32le"
_is_clang_enabled=1
_commit='2ff24090376ae8eaf963696de0e20e3bc8bbe54f'

pkgbase='coreboot-toolchain'
pkgname=()
pkgver=4.22
pkgrel=1
pkgdesc='Used to build coreboot'
url='https://www.coreboot.org'
license=(BSD2 BSD3 GPL2 LGPL2Plus GPL3Plus)
arch=(x86_64 aarch64 riscv)
depends=() # TODO
makedepends=('gcc-ada' 'git' 'python') # TODO
options=('buildflags')
sources_gcc=(
  'https://ftpmirror.gnu.org/gmp/gmp-6.3.0.tar.xz'
  'https://ftpmirror.gnu.org/mpfr/mpfr-4.2.1.tar.xz'
  'https://ftpmirror.gnu.org/mpc/mpc-1.3.1.tar.gz'
  'https://ftpmirror.gnu.org/gcc/gcc-11.4.0/gcc-11.4.0.tar.xz'
  'https://ftpmirror.gnu.org/binutils/binutils-2.41.tar.xz'
)
sources_clang=(
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.6/llvm-16.0.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.6/clang-16.0.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.6/cmake-16.0.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.6/compiler-rt-16.0.6.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.6/clang-tools-extra-16.0.6.src.tar.xz'
  'https://cmake.org/files/v3.26/cmake-3.26.4.tar.gz'
)
source=(
  "git+https://review.coreboot.org/coreboot#commit=${_commit}"
  'https://github.com/acpica/acpica/archive/refs/tags/R06_28_23.tar.gz'
  'https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.bz2'
)
hashes_gcc=(
  'a3c2b80201b89e68616f4ad30bc66aee4927c3ce50e33929ca819d5c43538898'
  '277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2'
  'ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8'
  '3f2db222b007e8a4a23cd5ba56726ef08e8b1f1eb2055ee72c1402cea73a8dd9'
  'ae9a5789e23459e59606e6714723f2d3ffc31c03174191ef0d015bdf06007450'
)
hashes_clang=(
  'e91db44d1b3bb1c33fcea9a7d1f2423b883eaa9163d3d56ca2aa6d2f0711bc29'
  '1186b6e6eefeadd09912ed73b3729e85b59f043724bb2818a95a2ec024571840'
  '39d342a4161095d2f28fb1253e4585978ac50521117da666e2b1f6f28b62f514'
  '7911a2a9cca10393a17f637c01a6f5555b0a38f64ff47dc9168413a4190bc2db'
  '174c7844db2590b18b2a59a9ce503f8fe439edc2de2f0f625006501c99736f31'
  '313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208'
)
sha256sums=(
  'SKIP'
  '2248799b7ca08a7711ac87d31924354ed49047507607d033bd327ba861ec4d31'
  '35b6ad2ee048d41c4779f073f3efca7762a822b7d2d4ef4e8df24cf65747bb2e'
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

package_coreboot-toolchain-gcc-nds32le() {
  do_package_gcc
}

package_coreboot-toolchain-clang() {
  do_package_clang
}
