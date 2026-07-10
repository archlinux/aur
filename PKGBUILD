# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-musl-bin
pkgver=2026.07.10
pkgrel=1
pkgdesc="GNU toolchain for riscv64 MUSL, including GCC."
arch=('x86_64')
url="https://github.com/riscv-collab/riscv-gnu-toolchain"
license=('GPL2')
provides=(
)
conflicts=(
)
optdepends=()
makedepends=()
options=(!strip)
source=(
  "riscv64-gnu-toolchain-musl-bin-2026.07.10-riscv64-musl-ubuntu-24.04-gcc.tar.xz::https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2026.07.10/riscv64-musl-ubuntu-24.04-gcc.tar.xz"
)
sha512sums=(
  "fbd78c052ea8b98a028c3d3e508dbba6a1af3a7dd385ce4aabe56d89573ffc5b4c5df7e7de9d66284baa1373aa54397c6b3abe025acee29a910b773b8caa0080"
)

package() {
  install -dm755 "${pkgdir}"/opt/riscv64-gnu-toolchain-musl-bin "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib/gcc
  cp -pR "${srcdir}"/riscv/* "${pkgdir}"/opt/riscv64-gnu-toolchain-musl-bin

  # Install sysroot
  if test -d "${pkgdir}"/opt/riscv64-gnu-toolchain-musl-bin/sysroot; then
    sysroot=/opt/riscv64-gnu-toolchain-musl-bin/sysroot
  else
    sysroot=/opt/riscv64-gnu-toolchain-musl-bin/riscv64-unknown-linux-musl
  fi
  ln -s "${sysroot}" "${pkgdir}"/usr/riscv64-unknown-linux-musl

  # Install cross libgcc
  ln -s /opt/riscv64-gnu-toolchain-musl-bin/lib/gcc/riscv64-unknown-linux-musl "${pkgdir}"/usr/lib/gcc

  # Install binaries
  for f in "${srcdir}"/riscv/bin/riscv64-unknown-linux-musl-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv64-gnu-toolchain-musl-bin/bin/"${f}" "${pkgdir}"/usr/bin
  done

  

  # Strip
  find \
    "${pkgdir}"/opt/riscv64-gnu-toolchain-musl-bin/bin \
    "${pkgdir}"/opt/riscv64-gnu-toolchain-musl-bin/lib \
    "${pkgdir}"/opt/riscv64-gnu-toolchain-musl-bin/libexec \
    -type f \
    -exec /bin/sh -c 'if file --no-sandbox "$0" | grep -qE "ELF.*(executable|shared object)"; then strip "$0"; fi' {} \;
}