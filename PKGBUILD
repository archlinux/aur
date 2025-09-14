# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-elf-llvm-bin
pkgver=2025.09.14
pkgrel=1
pkgdesc="GNU toolchain for riscv64 ELF, including GCC and clang."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
provides=(
  'riscv64-gnu-toolchain-elf-bin'
)
conflicts=(
  'riscv64-gnu-toolchain-elf-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2025.09.14/riscv64-elf-ubuntu-24.04-llvm-nightly-2025.09.14-nightly.tar.xz"
)
sha512sums=(
  "9aec46d3cb0e2c6f98e646b3b255fec7c0c1bdfa2a0f6721b17becd1eff30a4cebe992250f60d91597cc085330727041775ebaff33d9e8764353aae3d1deb046"
)

package() {
  install -dm755 "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin

  # Install sysroot
  if test -d "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin/sysroot; then
    sysroot=/opt/riscv64-gnu-toolchain-elf-llvm-bin/sysroot
  else
    sysroot=/opt/riscv64-gnu-toolchain-elf-llvm-bin/riscv64-unknown-elf
  fi
  ln -s "${sysroot}" "${pkgdir}"/usr/riscv64-unknown-elf

  # Install cross libgcc
  ln -s /opt/riscv64-gnu-toolchain-elf-llvm-bin/lib/gcc/riscv64-unknown-elf "${pkgdir}"/usr/lib/gcc

  # Install binaries
  for f in "${srcdir}"/riscv/bin/riscv64-unknown-elf-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv64-gnu-toolchain-elf-llvm-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done

  # Also provide target quadruplet to prevent confusing clang
  ln -s riscv64-unknown-elf "${pkgdir}"/usr/riscv64-unknown-unknown-elf
  ln -s riscv64-unknown-elf "${pkgdir}"/usr/lib/gcc/riscv64-unknown-unknown-elf
  find \
    "${pkgdir}" \
    -name riscv64-unknown-elf \
    -type d \
    -exec /bin/sh -c 'ln -s riscv64-unknown-elf "$(dirname "$0")"/riscv64-unknown-unknown-elf' {} \;

  # Strip
  find \
    "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin/bin \
    "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin/lib \
    "${pkgdir}"/opt/riscv64-gnu-toolchain-elf-llvm-bin/libexec \
    -type f \
    -exec /bin/sh -c 'if file --no-sandbox "$0" | grep -qE "ELF.*(executable|shared object)"; then strip "$0"; fi' {} \;
}