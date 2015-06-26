# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=rpcs3-git
pkgver=0.0.0.5.r1833.bf74c0c
pkgrel=1
pkgdesc='A Sony PlayStation 3 emulator'
arch=('x86_64')
url='https://github.com/DHrpcs3/rpcs3'
license=('GPL2')
depends=('ffmpeg' 'glew' 'openal' 'wxgtk')
makedepends=('asmjit-git' 'cmake' 'git' 'llvm35')
provides=('rpcs3')
conflicts=('rpcs3')
source=('git+https://github.com/DHrpcs3/rpcs3.git'
        'rpcs3-system-libs.patch')
sha256sums=('SKIP'
            'ba7e9e639f3254359ae41f74a4604f856be7a86e22cb0ca0476d8fe1445bb916')

pkgver() {
  cd rpcs3

  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd rpcs3

  patch -Np1 -i ../rpcs3-system-libs.patch
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
