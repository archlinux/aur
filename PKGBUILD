# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: perlawk <perlawk@yahoo.com.hk>
# Contributor: xantares <xantares09@hotmail.com>

pkgname=asmjit-git
pkgver=r162.bd0d261
pkgrel=1
pkgdesc='Complete x86/x64 JIT and Remote Assembler for C++'
arch=('i686' 'x86_64')
url='https://github.com/kobalicek/asmjit'
license=('customi:zlib')
depends=('gcc-libs')
makedepends=('cmake' 'git')
options=('staticlibs')
source=('git+https://github.com/kobalicek/asmjit.git')
sha256sums=('SKIP')

pkgver() {
  cd asmjit

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed 's/-fno-exceptions//g' -i asmjit/CMakeLists.txt

  cp -r asmjit asmjit-static
}

build () {
  cd asmjit

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make

  cd ../../asmjit-static

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DASMJIT_STATIC='TRUE'
  make
}

package () {
  cd asmjit/build

  make install DESTDIR="${pkgdir}"

  cd ../../asmjit-static/build

  make install DESTDIR="${pkgdir}"

  install -dm 755 "${pkgdir}"/usr/share/licenses/asmjit-git
  install -m 644 ../LICENSE.md "${pkgdir}"/usr/share/licenses/asmjit-git/
}

# vim: ts=2 sw=2 et:
