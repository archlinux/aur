# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-elf-llvm-bin
pkgver=2025.05.22
pkgrel=1
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
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2025.05.22/riscv32-elf-ubuntu-24.04-llvm-nightly-2025.05.22-nightly.tar.xz"
)
sha512sums=(
  "b03582cc2cc789569fd6ea4ff8af33d5d37c30fb782c186c2d81272182f251840a4c87547bbebc0f78e2e5e15bb13a4f4dc9548247be2ddc6cf3de6486999284"
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