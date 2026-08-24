# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-glibc-llvm-bin
pkgver=2026.08.24
pkgrel=1
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
  "riscv32-gnu-toolchain-glibc-llvm-bin-2026.08.24-riscv32-glibc-ubuntu-24.04-llvm.tar.xz::https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2026.08.24/riscv32-glibc-ubuntu-24.04-llvm.tar.xz"
)
sha512sums=(
  "6417899bd124c7a86c032ab81f40a9e91776c5db1a6daccf7ba76c61922f307fde5ce5c6f7f59843d052f4837016f22a8112d04d77877facef79abedf648555a"
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