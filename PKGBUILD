# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Previous Maintainer: Jonas Wunderlich <aur [at] 03j [dot] de>
# Previous Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=crystalline
pkgver=0.17.1
_crystal_version=1.16.2
pkgrel=1
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
depends=("gc" "libevent" "pcre" "libyaml")
makedepends=("make" "crystal>=1.10.1" "shards" "llvm" "llvm-libs")
source=("crystal.tar.gz::https://github.com/crystal-lang/crystal/archive/refs/tags/${_crystal_version}.tar.gz" "${pkgname}-${pkgver}.tar.gz::https://github.com/elbywan/crystalline/archive/v${pkgver}.tar.gz")
sha256sums=('4f032761a4018c6fbcf1649b866217d9eb2f3139599c70fcb6dac83714839c5e'
            '3e8f4c3f41830092300219ef91c3d03e15536774ef18a5395ff6a9fffc27be5b')

build() {
  # https://github.com/crystal-lang/crystal/issues/12896#issuecomment-1371482597
  # hack to make it work an archlinux
  cd "${srcdir}/crystal-${_crystal_version}/src/llvm/ext/" || exit
  llvm_cpp_flags=$(llvm-config --cppflags)
  gcc -c llvm_ext.cc "${llvm_cpp_flags}" -O3
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  CRYSTAL_PATH="${srcdir}/crystal-${_crystal_version}/src:lib" shards build crystalline --release --no-debug --progress -Dpreview_mt
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  install -D -m 0755 bin/crystalline "${pkgdir}/usr/bin/crystalline"
}
