# Maintainer: Asakura Mizu <asakuramizu111@gmail.com>
pkgname=riscv64-unknown-elf-toolchain-bin
pkgver=2020.12.0
pkgrel=1
pkgdesc="SiFive Freedom Bare Metal Toolchain"
arch=('x86_64')
url="https://github.com/sifive/freedom-tools"
license=('EPL-1.0')
provides=()
conflicts=('riscv64-gnu-toolchain-elf-bin')
optdepends=()
makedepends=()
options=(!strip !lto)
source=("https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz")
sha512sums=("26b446432bcf9601450870c2959b6e9d67c9d0b7618d7529f7703a38ec30fc00baf6a37417bd291c97d2743807a598c116b364ee69e74f74c860a7de346ea295")

package() {
  mkdir -p "${pkgdir}"/usr/bin "${pkgdir}"/opt

  cp -pr "${srcdir}"/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14 "${pkgdir}"/opt/riscv64-unknown-elf-toolchain
  ln -s /opt/riscv64-unknown-elf-toolchain/riscv64-unknown-elf "${pkgdir}"/usr/riscv64-unknown-elf

  for f in "${pkgdir}"/opt/riscv64-unknown-elf-toolchain/bin/riscv64-unknown-elf-*; do
    f="$(basename "${f}")"
    ln -s /opt/riscv64-unknown-elf-toolchain/bin/"${f}" "${pkgdir}"/usr/bin
  done

  # Strip
  find \
    "${pkgdir}"/opt/riscv64-unknown-elf-toolchain/bin \
    "${pkgdir}"/opt/riscv64-unknown-elf-toolchain/lib \
    "${pkgdir}"/opt/riscv64-unknown-elf-toolchain/libexec \
    -type f \
    -exec /bin/sh -c 'if file --no-sandbox "$0" | grep -qE "ELF.*(executable|shared object)"; then strip "$0"; fi' {} \;
}
