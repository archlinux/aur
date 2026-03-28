# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-musl-bin
pkgver=2026.03.28
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
  "riscv64-gnu-toolchain-musl-bin-2026.03.28-riscv64-musl-ubuntu-24.04-gcc.tar.xz::https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2026.03.28/riscv64-musl-ubuntu-24.04-gcc.tar.xz"
)
sha512sums=(
  "cf8407882cecfdf17e85b6e33895911156217173b8e80ba0ecd0f5436ca489d90e38a0112db1ddccad941af58db6e8d64647f797c2051969539010288eb5e304"
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