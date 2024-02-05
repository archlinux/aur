# Maintainer: Jonas Wunderlich <aur [at] 03j [dot] de>
# Previous Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=crystalline
pkgver=0.12.2
_crystal_version=1.11.1
pkgrel=3
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
depends=("gc" "libevent" "pcre" "libyaml")
makedepends=("make" "crystal>=1.10.1" "shards" "llvm" "llvm-libs")
source=("crystal.tar.gz::https://github.com/crystal-lang/crystal/archive/refs/tags/${_crystal_version}.tar.gz" "${pkgname}-${pkgver}.tar.gz::https://github.com/elbywan/crystalline/archive/v${pkgver}.tar.gz")
sha256sums=('d947b0cc5f1aa5d8003f18b75cc49e94365a528218ff9bc6305c63d903918b24'
            '32d137f1e4edd29c74381cc010e9080379346b23646ca5f0806f64d2e05628fb')

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
