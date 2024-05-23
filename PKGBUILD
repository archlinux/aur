# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-elf-llvm-bin
pkgver=2024.04.12
pkgrel=5
pkgdesc="GNU toolchain for riscv32 ELF, including GCC and clang."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
provides=(
  'riscv32-gnu-toolchain-elf-bin'
)
conflicts=(
  'riscv32-gnu-toolchain-elf-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.04.12/riscv32-elf-ubuntu-22.04-llvm-nightly-2024.04.12-nightly.tar.gz"
)
sha512sums=(
  "c1d3b81b5c09ebcec447ffeaf2850c8636daa8d10f865ce004f183bc41aa71f5219c13322b2ba14d43a9ab95270aae682e6fb84bd444889953bc42ee4660ecb2"
)

package() {
  install -dm755 "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-llvm-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-llvm-bin

  # Install sysroot
  if test -d "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-llvm-bin/sysroot; then
    sysroot=/opt/riscv32-gnu-toolchain-elf-llvm-bin/sysroot
  else
    sysroot=/opt/riscv32-gnu-toolchain-elf-llvm-bin/riscv32-unknown-elf
  fi
  ln -s "${sysroot}" "${pkgdir}"/usr/riscv32-unknown-elf

  # Install cross libgcc
  ln -s /opt/riscv32-gnu-toolchain-elf-llvm-bin/lib/gcc/riscv32-unknown-elf "${pkgdir}"/usr/lib/gcc

  # Install binaries
  for f in "${srcdir}"/riscv/bin/riscv32-unknown-elf-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv32-gnu-toolchain-elf-llvm-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done

  # Also provide target quadruplet to prevent confusing clang
  ln -s riscv32-unknown-elf "${pkgdir}"/usr/riscv32-unknown-unknown-elf
  ln -s riscv32-unknown-elf "${pkgdir}"/usr/lib/gcc/riscv32-unknown-unknown-elf
  find \
    "${pkgdir}" \
    -name riscv32-unknown-elf \
    -type d \
    -exec /bin/sh -c 'ln -s riscv32-unknown-elf "$(dirname "$0")"/riscv32-unknown-unknown-elf' {} \;

  # Strip
  find \
    "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-llvm-bin/bin \
    "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-llvm-bin/lib \
    "${pkgdir}"/opt/riscv32-gnu-toolchain-elf-llvm-bin/libexec \
    -type f \
    -exec /bin/sh -c 'if file --no-sandbox "$0" | grep -qE "ELF.*(executable|shared object)"; then strip "$0"; fi' {} \;
}