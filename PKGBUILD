# Maintainer: Jonas Wunderlich <aur [at] 03j [dot] de>
# Previous Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=crystalline
pkgver=0.10.0
_crystal_version=1.9.2
pkgrel=1
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
depends=("gc" "libevent" "pcre" "libyaml" "llvm-libs")
makedepends=("make" "crystal>=1.4.1" "shards>=0.16.0" "llvm>=13.0.0" "llvm-libs>=13.0.0")
source=("crystal.tar.gz::https://github.com/crystal-lang/crystal/archive/refs/tags/${_crystal_version}.tar.gz" "${pkgname}-${pkgver}.tar.gz::https://github.com/elbywan/crystalline/archive/v${pkgver}.tar.gz")
sha256sums=('1e2e6974b0e2e152e5fae5388415ddb7e192378c8ac215c6f386fdaf9018e54f'
            '26c926ba423e4b04fc52af501cd842c8255312014fc4aa1bc3735a8cd0df3426')

build() {
  # https://github.com/crystal-lang/crystal/issues/12896#issuecomment-1371482597
  # hack to make it work an archlinux
  cd "${srcdir}/crystal/src/llvm/ext/" || exit
  llvm_cpp_flags=$(llvm-config --cppflags)
  gcc -c llvm_ext.cc "${llvm_cpp_flags}" -O3
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  CRYSTAL_PATH="${srcdir}/crystal/src:lib" shards build crystalline --release --no-debug --progress -Dpreview_mt
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  install -D -m 0755 bin/crystalline "${pkgdir}/usr/bin/crystalline"
}
