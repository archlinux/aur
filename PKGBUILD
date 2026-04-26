# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv32-gnu-toolchain-glibc-bin
pkgver=2026.04.26
pkgrel=1
pkgdesc="GNU toolchain for riscv32 Linux, including GCC."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
provides=(
)
conflicts=(
  'riscv32-gnu-toolchain-glibc-llvm-bin'
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "riscv32-gnu-toolchain-glibc-bin-2026.04.26-riscv32-glibc-ubuntu-24.04-gcc.tar.xz::https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2026.04.26/riscv32-glibc-ubuntu-24.04-gcc.tar.xz"
)
sha512sums=(
  "5875b39da6365dcfd425460a7116447e0a24486bb2f8ad1a8368639e101e447caf3be5620159ad8c94e4e44cc7ad3d199244dbd7b7049588ac83292f80af898a"
)

package() {
  install -dm755 "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-bin

  # Install sysroot
  if test -d "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-bin/sysroot; then
    sysroot=/opt/riscv32-gnu-toolchain-glibc-bin/sysroot
  else
    sysroot=/opt/riscv32-gnu-toolchain-glibc-bin/riscv32-unknown-linux-gnu
  fi
  ln -s "${sysroot}" "${pkgdir}"/usr/riscv32-unknown-linux-gnu

  # Install cross libgcc
  ln -s /opt/riscv32-gnu-toolchain-glibc-bin/lib/gcc/riscv32-unknown-linux-gnu "${pkgdir}"/usr/lib/gcc

  # Install binaries
  for f in "${srcdir}"/riscv/bin/riscv32-unknown-linux-gnu-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv32-gnu-toolchain-glibc-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done

  

  # Strip
  find \
    "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-bin/bin \
    "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-bin/lib \
    "${pkgdir}"/opt/riscv32-gnu-toolchain-glibc-bin/libexec \
    -type f \
    -exec /bin/sh -c 'if file --no-sandbox "$0" | grep -qE "ELF.*(executable|shared object)"; then strip "$0"; fi' {} \;
}