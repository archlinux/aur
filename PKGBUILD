# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=lunarglass-git
pkgver=20161115
pkgrel=1
pkgdesc="LLVM IR and optimizer for shaders, including front-end adapters for GLSL and SPIR-V"
arch=('i686' 'x86_64')
url="https://github.com/LunarG/LunarGLASS"
license=('unknown')
makedepends=('git' 'cmake' 'python')
provides=('lunarglass')
conflicts=('lunarglass')
source=('git+git://github.com/LunarG/LunarGLASS.git'
        'git+git://github.com/KhronosGroup/glslang.git'
        'http://llvm.org/releases/3.4/llvm-3.4.src.tar.gz')
md5sums=('SKIP'
         'SKIP'
         '46ed668a1ce38985120dbf6344cf6116')
noextract=('llvm-3.4.src.tar.gz')

prepare() {
  cd LunarGLASS/Core/LLVM
  tar xf ${srcdir}/llvm-3.4.src.tar.gz
  git checkout -f .
}

build() {
  # Build glslang
  mkdir glslang/build
  cd "${srcdir}/glslang/build"
  cmake ..
  make
  make install

  # Build LLVM
  mkdir "${srcdir}/LunarGLASS/Core/LLVM/llvm-3.4/build"
  cd "${srcdir}/LunarGLASS/Core/LLVM/llvm-3.4/build"
  ../configure
  make REQUIRES_RTTI=1
  make install DESTDIR=$(pwd)/install

  # Build LunarGLASS
  mkdir "${srcdir}/LunarGLASS/build"
  cd "${srcdir}/LunarGLASS/build"
  cmake ..
  make
}

package() {
  cd "${srcdir}/LunarGLASS/build"

  install -Dm755 Standalone/LunarGOO "${pkgdir}"/usr/bin/LunarGOO
}

# vim:set ts=2 sw=2 et:
