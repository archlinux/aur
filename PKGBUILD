# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-musl-bin
pkgver=2026.01.01
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
  "riscv64-gnu-toolchain-musl-bin-2026.01.01-riscv64-musl-ubuntu-24.04-gcc.tar.xz::https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2026.01.01/riscv64-musl-ubuntu-24.04-gcc.tar.xz"
)
sha512sums=(
  "1b2a5a5e7231bdcdcd9153fff97f7e62a9ce61007e122996697c27733aad5b8f62ca2135356605aba770d5559d67d04da06845feab6ea689dcde0c06b0171ccc"
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