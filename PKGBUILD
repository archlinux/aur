# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-glibc-llvm-bin
pkgver=2024.08.06
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
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2024.08.06/riscv64-glibc-ubuntu-22.04-llvm-nightly-2024.08.06-nightly.tar.gz"
)
sha512sums=(
  "fbdd26f527b989253c6d3fe99427d93bbdb63b12bd7e9cc7fa0a9fb0f0d28939a0c242c263e012209aab2b9f639191343719ab826e86f65cbae0f00420706d57"
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