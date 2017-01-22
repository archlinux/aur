# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

_realname=glslc
pkgname=$_realname-git
pkgver=r323.4fa3150
pkgrel=1
epoch=1
pkgdesc="Command-line GLSL/HLSL to SPIR-V compiler with Clang-compatible arguments"
arch=('i686' 'x86_64')
url='https://github.com/google/shaderc/tree/master/glslc'
license=('Apache')
makedepends=('git' 'cmake' 'ninja' 'python')
provides=("${_realname}=${pkgver}")
conflicts=("$_realname")
source=('git+https://github.com/google/shaderc')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/shaderc
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git log --pretty=format:'%h' -n 1)
}

prepare() {
  # Fetch source dependencies
  cd "$srcdir"/shaderc/third_party/

  if [ ! -d googletest ]; then
    git clone https://github.com/google/googletest.git
  fi

  if [ ! -d glslang ]; then
    git clone https://github.com/google/glslang.git
  fi

  if [ ! -d spirv-tools ]; then
    git clone https://github.com/KhronosGroup/SPIRV-Tools.git spirv-tools
  fi

  if [ ! -d spirv-tools/external/spirv-headers ]; then
    git clone https://github.com/KhronosGroup/SPIRV-Headers.git spirv-tools/external/spirv-headers
  fi
}

build() {
  cd "$srcdir"

  mkdir -p build
  cd build

  cmake "$srcdir"/shaderc \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -GNinja \
    -Dshaderc_SOURCE_DIR="$srcdir"/shaderc \
    -DPYTHON_EXE=/usr/bin/python2
  ninja glslc
}

check(){
  cd "$srcdir"/build
  ninja test
}

package() {
  cd "$srcdir"/build

  install -d "$pkgdir"/usr/{bin,share/doc/"$_realname"}
  install -m755 glslc/glslc "$pkgdir"/usr/bin/
  install -m644 ../shaderc/glslc/README.asciidoc "$pkgdir"/usr/share/doc/"$_realname"/
}
