# Maintainer: Christoph Haag <haagch@frickel.club>
pkgname=glslang-svn
pkgver=r31716
pkgrel=1
pkgdesc="Glslang is the official reference compiler front end for the OpenGL ES and OpenGL shading languages. Also includes spirv-remap (improve compression of SPIR-V binary files)"
arch=("i686" "x86_64")
url="http://www.khronos.org/opengles/sdk/tools/Reference-Compiler/"
license=('GPL')
groups=()
depends=()
makedepends=('subversion' 'cmake' 'subversion')
provides=("glslang")
source=("svn+https://cvs.khronos.org/svn/repos/ogl/trunk/ecosystem/public/sdk/tools/glslang")
md5sums=("SKIP") #generate with 'makepkg -g'

prepare() {
  #rm -rf "$srcdir/build"
  # why can't Khronos figure out how to use cmake correctly?
  sed -i '/set(CMAKE_INSTALL_PREFIX/d' "$srcdir/glslang/CMakeLists.txt"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir"/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../glslang
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$srcdir/glslang"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}


# vim:set ts=2 sw=2 et:
