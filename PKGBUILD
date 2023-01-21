# Maintainer: Felix Singer <felixsinger@posteo.net>

_targets="i386 x64 arm aarch64 riscv ppc64 nds32le clang"
_commit='4d661eebe95b06acae7d99777ed36ba56a560112'

pkgbase='coreboot-toolchain'
pkgname=()
pkgver=4.19
pkgrel=1
pkgdesc='Used to build coreboot'
url='https://www.coreboot.org'
license=(BSD2 BSD3 GPL2 LGPL2Plus GPL3Plus)
arch=(x86_64 aarch64 riscv)
depends=() # TODO
makedepends=('python3' 'gcc-ada') # TODO
options=('buildflags')
source=("git+https://review.coreboot.org/coreboot#commit=${_commit}")
sha256sums=('SKIP')


for target in ${_targets}; do
  pkgname+=("${pkgbase}-${target}")
done


build() {
  cd coreboot
  export CFLAGS=${CFLAGS/-Werror=format-security/}
  export CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  is_clang_enabled=0

  for target in ${_targets}; do
    [ "${target}" = "clang" ] && is_clang_enabled=1 && continue
    make crossgcc-${target} CPUS=$(nproc) DEST="${srcdir}/${target}"
  done

  if [ ${is_clang_enabled} -eq 1 ]; then
    for component in "clang iasl nasm"; do
      make ${component} CPUS=$(nproc) DEST="${srcdir}/${target}"
    done
  fi
}

do_package_gcc() {
  target="$(echo ${pkgname} | cut -d '-' -f 3)"

  toolchain_dir="usr/${target}-coreboot-gnu"
  dest_path="${pkgdir}/${toolchain_dir}"
  mkdir -p ${dest_path}
  mv ${srcdir}/${target}/* "${dest_path}"
}

do_package_clang() {
  toolchain_dir="usr/multiarch-coreboot-clang"
  dest_path="${pkgdir}/${toolchain_dir}"
  mkdir -p ${dest_path}
  mv ${srcdir}/clang/* "${dest_path}"/
}

package_coreboot-toolchain-i386() {
  do_package_gcc
}

package_coreboot-toolchain-x64() {
  do_package_gcc
}

package_coreboot-toolchain-arm() {
  do_package_gcc
}

package_coreboot-toolchain-aarch64() {
  do_package_gcc
}

package_coreboot-toolchain-riscv() {
  do_package_gcc
}

package_coreboot-toolchain-ppc64() {
  do_package_gcc
}

package_coreboot-toolchain-nds32le() {
  do_package_gcc
}

package_coreboot-toolchain-clang() {
  do_package_clang
}
