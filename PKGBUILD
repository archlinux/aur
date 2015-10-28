# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=shaderc
pkgver=87.6c4d33d
pkgrel=1
epoch=1
pkgdesc="A collection of tools, libraries and tests for shader compilation. Contains glslc."
arch=('i686' 'x86_64')
url="https://github.com/google/shaderc"
license=('apache')
makedepends=('git' 'cmake' 'ninja')
provides=("${pkgname}=${pkgver}")
#depends=()
#conflicts=("${pkgname}")
#options=()

source=("git://github.com/google/shaderc.git")
md5sums=("SKIP")

pkgver() {
  cd $pkgname
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $revision.$hash
}

prepare() {
  # Fetch source dependencies
  cd $pkgname/third_party/
  if [ ! -d gmock-1.7.0 ]; then
    git clone -b release-1.7.0 https://github.com/google/googlemock.git gmock-1.7.0
  fi
  if [ ! -d gmock-1.7.0/gtest ]; then
    git clone -b release-1.7.0 https://github.com/google/googletest.git gmock-1.7.0/gtest
  fi
  if [ ! -d glslang ]; then
    git clone https://github.com/google/glslang
  fi
}

build() {
  cd $srcdir
  if [ ! -d build ]; then
    mkdir build
  fi
  cd build
  
  cmake $srcdir/$pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -GNinja \
    -Dshaderc_SOURCE_DIR=$srcdir/$pkgname \
    -DPYTHON_EXE=/usr/bin/python2

  ninja
}

package() {
  cd $srcdir/build
  DESTDIR="$pkgdir" ninja install
  cp glslc/glslc $pkgdir/usr/bin
  cp glslc/libglslc.a $pkgdir/usr/lib
  cp libshaderc/libshaderc.a $pkgdir/usr/lib
  cp libshaderc/libshaderc_combined.a $pkgdir/usr/lib
  cp libshaderc_util/libshaderc_util.a $pkgdir/usr/lib
}
