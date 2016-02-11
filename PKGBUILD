# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

realname=shaderc
pkgname=$realname-git
pkgver=156.7b94f85
pkgrel=1
epoch=1
pkgdesc="A collection of tools, libraries and tests for shader compilation. Contains glslc and SPIR-V binary tools."
arch=('i686' 'x86_64')
url="https://github.com/google/shaderc"
license=('apache')
makedepends=('git' 'cmake' 'ninja')
provides=("${pkgname}=${pkgver}")
conflicts=("shaderc")
source=("git://github.com/google/shaderc.git")
md5sums=("SKIP")

pkgver() {
  cd $realname
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $revision.$hash
}

prepare() {
  # Fetch source dependencies
  cd $realname/third_party/
  if [ ! -d googletest ]; then
    git clone https://github.com/google/googletest.git
  fi
  if [ ! -d glslang ]; then
    git clone https://github.com/google/glslang.git
  fi
  if [ ! -d spirv-tools ]; then
    git clone https://github.com/KhronosGroup/SPIRV-Tools.git spirv-tools
  fi
}

build() {
  cd $srcdir
  if [ ! -d build ]; then
    mkdir build
  fi

  cd build

  cmake $srcdir/$realname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -GNinja \
    -Dshaderc_SOURCE_DIR=$srcdir/$realname \
    -DPYTHON_EXE=/usr/bin/python2
  ninja
}

package() {
  cd $srcdir/build
  DESTDIR="$pkgdir" ninja install
  
  cp glslc/glslc $pkgdir/usr/bin
  #cp glslc/libglslc.a $pkgdir/usr/lib
  #cp libshaderc/libshaderc.a $pkgdir/usr/lib
  #cp libshaderc/libshaderc_combined.a $pkgdir/usr/lib
  #cp libshaderc_util/libshaderc_util.a $pkgdir/usr/lib
  
  # remove gmock and gtest
  rm $pkgdir/usr/include/gmock -R
  rm $pkgdir/usr/include/gtest -R
  
  rm $pkgdir/usr/lib/libgtest*
  rm $pkgdir/usr/lib/libgmock*
  
  
}
