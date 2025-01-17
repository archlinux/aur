# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-glibc-llvm-bin
pkgver=2025.01.17
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
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2025.01.17/riscv64-glibc-ubuntu-24.04-llvm-nightly-2025.01.17-nightly.tar.xz"
)
sha512sums=(
  "b786ccdd11749d3035586eb2623da8632cb2d5af4fb8da6b61bda2c480d362a64b4e4ae396b615603d0143929183552d0567cf7fced5e121de38a637455f46cf"
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