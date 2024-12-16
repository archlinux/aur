# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-glibc-llvm-bin
pkgver=2024.12.16
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
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.12.16/riscv32-glibc-ubuntu-24.04-llvm-nightly-2024.12.16-nightly.tar.xz"
)
sha512sums=(
  "7062ca953d1ae55145c57c394e7d09816184a3c7114e3cd9d3619ce75ebd2fd37097873334f60fc1405748e68baadfb9d944e2a86bbbc339e4f2771494e23f17"
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