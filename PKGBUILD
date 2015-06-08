# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=rpcs3-git
pkgver=0.0.0.5.r1801.e6df1dd
pkgrel=1
pkgdesc='A Sony PlayStation 3 emulator'
arch=('x86_64')
url='https://github.com/DHrpcs3/rpcs3'
license=('GPL2')
depends=('glew' 'openal' 'wxgtk')
makedepends=('cmake' 'git' 'llvm')
provides=('rpcs3')
conflicts=('rpcs3')
source=('git+https://github.com/DHrpcs3/rpcs3.git')
sha256sums=('SKIP')

pkgver() {
  cd rpcs3

  printf "%s" "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd rpcs3

  git submodule init asmjit
  git submodule init ffmpeg
  git submodule update
}

build() {
  cd rpcs3

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_SKIP_RPATH='TRUE'
  make

}

package() {
  cd rpcs3/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 bin/rpcs3 "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
