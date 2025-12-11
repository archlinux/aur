# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-glibc-llvm-bin
pkgver=2025.11.27
pkgrel=2
pkgdesc="GNU toolchain for riscv32 Linux, including GCC and clang."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
provides=(
  'riscv32-gnu-toolchain-glibc-bin'
)
conflicts=(
  'riscv32-gnu-toolchain-glibc-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "riscv32-gnu-toolchain-glibc-llvm-bin-2025.11.27-riscv32-glibc-ubuntu-24.04-llvm.tar.xz::https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2025.11.27/riscv32-glibc-ubuntu-24.04-llvm.tar.xz"
)
sha512sums=(
  "cab833cbe96ed5f3aecff59c66a4d84d8ae7a17ef6a3d5926241629d4fae762e7f7273616785cf865accfa6cf7d302c574bc9a4b60945294f89d62db75886bfc"
)

package() {
  install -dm755 "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-llvm-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-llvm-bin

  # Install sysroot
  if test -d "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-llvm-bin/sysroot; then
    sysroot=/opt/riscv32-gnu-toolchain-glibc-llvm-bin/sysroot
  else
    sysroot=/opt/riscv32-gnu-toolchain-glibc-llvm-bin/riscv32-unknown-linux-gnu
  fi
  ln -s "${sysroot}" "${pkgdir}"/usr/riscv32-unknown-linux-gnu

  # Install cross libgcc
  ln -s /opt/riscv32-gnu-toolchain-glibc-llvm-bin/lib/gcc/riscv32-unknown-linux-gnu "${pkgdir}"/usr/lib/gcc

  # Install binaries
  for f in "${srcdir}"/riscv/bin/riscv32-unknown-linux-gnu-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv32-gnu-toolchain-glibc-llvm-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done

  

  # Strip
  find \
    "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-llvm-bin/bin \
    "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-llvm-bin/lib \
    "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-llvm-bin/libexec \
    -type f \
    -exec /bin/sh -c 'if file --no-sandbox "$0" | grep -qE "ELF.*(executable|shared object)"; then strip "$0"; fi' {} \;
}