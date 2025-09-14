# Maintainer: Gilbert Gilb's <gilbsgilbert@gmail.com>
pkgname=riscv64-gnu-toolchain-musl-bin
pkgver=2025.09.14
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
  "https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2025.09.14/riscv64-musl-ubuntu-24.04-gcc-nightly-2025.09.14-nightly.tar.xz"
)
sha512sums=(
  "2775e5e145465144968952019acdd2db667792397875da87f258b6ba1bc3dc1e9e1f2b082b812df135b34bbe60b1895da6d10e6e1415a22af96a4cd69c120587"
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