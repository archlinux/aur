# Maintainer: Felix Singer <felixsinger@posteo.net>

_gcc_targets="i386 x64 arm aarch64 riscv ppc64 nds32le"
_is_clang_enabled=1
_commit='465fbbe93ee01b4576689a90b7ddbeec23cdace2'

pkgbase='coreboot-toolchain'
pkgname=()
pkgver=4.20
pkgrel=1
pkgdesc='Used to build coreboot'
url='https://www.coreboot.org'
license=(BSD2 BSD3 GPL2 LGPL2Plus GPL3Plus)
arch=(x86_64 aarch64 riscv)
depends=() # TODO
makedepends=('gcc-ada' 'python') # TODO
options=('buildflags')
sources_gcc=(
  'https://ftpmirror.gnu.org/gmp/gmp-6.2.1.tar.xz'
  'https://ftpmirror.gnu.org/mpfr/mpfr-4.2.0.tar.xz'
  'https://ftpmirror.gnu.org/mpc/mpc-1.3.1.tar.gz'
  'https://ftpmirror.gnu.org/gcc/gcc-11.3.0/gcc-11.3.0.tar.xz'
  'https://ftpmirror.gnu.org/binutils/binutils-2.40.tar.xz'
)
sources_clang=(
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.7/llvm-15.0.7.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.7/clang-15.0.7.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.7/cmake-15.0.7.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.7/compiler-rt-15.0.7.src.tar.xz'
  'https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.7/clang-tools-extra-15.0.7.src.tar.xz'
  'https://cmake.org/files/v3.26/cmake-3.26.3.tar.gz'
)
source=(
  "git+https://review.coreboot.org/coreboot#commit=${_commit}"
  'https://github.com/acpica/acpica/archive/refs/tags/R10_20_22.tar.gz'
  'https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/nasm-2.15.05.tar.bz2'
)
hashes_gcc=(
  'fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2'
  '06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993'
  'ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8'
  'b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39'
  '0f8a4c272d7f17f369ded10a4aca28b8e304828e95526da482b0ccc4dfc9d8e1'
)
hashes_clang=(
  '4ad8b2cc8003c86d0078d15d987d84e3a739f24aae9033865c027abae93ee7a4'
  'a6b673ef15377fb46062d164e8ddc4d05c348ff8968f015f7f4af03f51000067'
  '8986f29b634fdaa9862eedda78513969fe9788301c9f2d938f4c10a3e7a3e7ea'
  '353832c66cce60931ea0413b3c071faad59eefa70d02c97daa8978b15e4b25b7'
  '809a2ef46d46be3b83ca389356404ac041fa6d8f5496cb02ec35d252afb64fd1'
  'bbd8d39217509d163cb544a40d6428ac666ddc83e22905d3e52c925781f0f659'
)
sha256sums=(
  'SKIP'
  '1aa17eb1779cd171110074ce271a65c06046eacbba7be7ce5ee71df1b31c3b86'
  '3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0'
)

for target in ${_gcc_targets}; do
  pkgname+=("${pkgbase}-${target}")
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
    make crossgcc-${target} CPUS=$(nproc) DEST="${srcdir}/${target}"
  done

  if [ ${_is_clang_enabled} -eq 1 ]; then
    for component in "clang iasl nasm"; do
      make ${component} CPUS=$(nproc) DEST="${srcdir}/${target}"
    done
  fi
}

do_package_gcc() {
  target="$(echo ${pkgname} | cut -d '-' -f 3)"

  toolchain_dir="usr/${target}-coreboot-gnu"
  dest_path="${pkgdir}/${toolchain_dir}"
  mkdir -p ${dest_path}
  mv ${srcdir}/${target}/* "${dest_path}"
}

do_package_clang() {
  toolchain_dir="usr/multiarch-coreboot-clang"
  dest_path="${pkgdir}/${toolchain_dir}"
  mkdir -p ${dest_path}
  mv ${srcdir}/clang/* "${dest_path}"/
}

package_coreboot-toolchain-i386() {
  do_package_gcc
}

package_coreboot-toolchain-x64() {
  do_package_gcc
}

package_coreboot-toolchain-arm() {
  do_package_gcc
}

package_coreboot-toolchain-aarch64() {
  do_package_gcc
}

package_coreboot-toolchain-riscv() {
  do_package_gcc
}

package_coreboot-toolchain-ppc64() {
  do_package_gcc
}

package_coreboot-toolchain-nds32le() {
  do_package_gcc
}

package_coreboot-toolchain-clang() {
  do_package_clang
}
