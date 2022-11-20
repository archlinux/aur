# Maintainer: Felix Singer <felixsinger@posteo.net>

_targets="i386 x64 arm aarch64 riscv ppc64 nds32le"
_commit='f4c97ea131944c7be940b35361407e4b63a14faf'

pkgbase='coreboot-toolchain'
pkgname=()
pkgver=4.18
pkgrel=1
pkgdesc='coreboot toolchain for target architecture '
url='https://www.coreboot.org'
license=(BSD2 BSD3 GPL2 LGPL2Plus GPL3Plus)
arch=(x86_64 aarch64 riscv)
depends=() # TODO
makedepends=() # TODO
options=('buildflags')
source=("git+https://review.coreboot.org/coreboot#commit=${_commit}")
sha256sums=('SKIP')


for target_arch in ${_targets}; do
  pkgname+=("${pkgbase}-${target_arch}")
done


build() {
  cd coreboot
  #export CFLAGS="$CFLAGS -Wno-error -Wno-format-security -Wno-error=format-security"
  #export CXXFLAGS="$CXXFLAGS -Wno-error -Wno-format-security -Wno-error=format-security"
  export CFLAGS=${CFLAGS/-Werror=format-security/}
  export CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  for target_arch in ${_targets}; do
    make crossgcc-${target_arch} CPUS=$(nproc) DEST="${srcdir}/${target_arch}"
  done
}

do_package() {
  target_arch="$(echo ${pkgname} | cut -d '-' -f 3)"
  pkgdesc+="${target_arch}"
  
  toolchain_dir="usr/${target_arch}-coreboot-gnu"
  dest_path="${pkgdir}/${toolchain_dir}"
  mkdir -p ${dest_path}
  mv ${srcdir}/${target_arch}/* "${dest_path}"
}

package_coreboot-toolchain-i386() {
  do_package
}

package_coreboot-toolchain-x64() {
  do_package
}

package_coreboot-toolchain-arm() {
  do_package
}

package_coreboot-toolchain-aarch64() {
  do_package
}

package_coreboot-toolchain-riscv() {
  do_package
}

package_coreboot-toolchain-ppc64() {
  do_package
}

package_coreboot-toolchain-nds32le() {
  do_package
}
