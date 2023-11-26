# Maintainer: Jonas Wunderlich <aur [at] 03j [dot] de>
# Previous Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=crystalline
pkgver=0.11.0
_crystal_version=1.10.1
pkgrel=3
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
depends=("gc" "libevent" "pcre" "libyaml")
makedepends=("make" "crystal>=1.10.1" "shards" "llvm" "llvm-libs")
source=("crystal.tar.gz::https://github.com/crystal-lang/crystal/archive/refs/tags/${_crystal_version}.tar.gz" "${pkgname}-${pkgver}.tar.gz::https://github.com/elbywan/crystalline/archive/v${pkgver}.tar.gz")
sha256sums=('f6449ffff519c86383f5e845455f3e6f6b10d6090effab09568f4c7414a8a51b'
            '488449ea0612034e6d4c9afac4c4bdac80111ea79dd6212d530ddf47f8d813f7')

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
