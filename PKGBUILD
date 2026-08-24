# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-glibc-llvm-bin
pkgver=2026.08.24
pkgrel=1
pkgdesc="GNU toolchain for riscv64 Linux, including GCC and clang."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
provides=(
  'riscv64-gnu-toolchain-glibc-bin'
)
conflicts=(
  'riscv64-gnu-toolchain-glibc-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "riscv64-gnu-toolchain-glibc-llvm-bin-2026.08.24-riscv64-glibc-ubuntu-24.04-llvm.tar.xz::https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2026.08.24/riscv64-glibc-ubuntu-24.04-llvm.tar.xz"
)
sha512sums=(
  "9e552cf31dff2dae3e4d83350fbd90fc3ffc1dcdcba12de5e616a74a7904f48a96281360fb986b9dc2b8065808c65b72e04e81ef79f684fab6205814906b4dcc"
)

package() {
  install -dm755 "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-llvm-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-llvm-bin

  # Install sysroot
  if test -d "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-llvm-bin/sysroot; then
    sysroot=/opt/riscv64-gnu-toolchain-glibc-llvm-bin/sysroot
  else
    sysroot=/opt/riscv64-gnu-toolchain-glibc-llvm-bin/riscv64-unknown-linux-gnu
  fi
  ln -s "${sysroot}" "${pkgdir}"/usr/riscv64-unknown-linux-gnu

  # Install cross libgcc
  ln -s /opt/riscv64-gnu-toolchain-glibc-llvm-bin/lib/gcc/riscv64-unknown-linux-gnu "${pkgdir}"/usr/lib/gcc

  # Install binaries
  for f in "${srcdir}"/riscv/bin/riscv64-unknown-linux-gnu-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv64-gnu-toolchain-glibc-llvm-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done

  

  # Strip
  find \
    "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-llvm-bin/bin \
    "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-llvm-bin/lib \
    "${pkgdir}"/opt/riscv64-gnu-toolchain-glibc-llvm-bin/libexec \
    -type f \
    -exec /bin/sh -c 'if file --no-sandbox "$0" | grep -qE "ELF.*(executable|shared object)"; then strip "$0"; fi' {} \;
}