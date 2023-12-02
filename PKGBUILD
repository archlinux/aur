#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=('shaderc-git')
pkgver=2023.7.6.gaaa44b5
pkgrel=1
pkgdesc="A collection of tools, libraries and tests for shader compilation. (GIT version)"
url='https://github.com/google/shaderc'
license=('Apache')
arch=('x86_64')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'glslang' # libSPIRV.so libglslang.so
  'spirv-tools'
)
makedepends=(
  'git'
  'ninja'
  'cmake'
  'python'
  'asciidoctor'
  'spirv-headers'
)
provides=(
  'shaderc'
  "shaderc=${pkgver}"
  'libshaderc_shared.so'
)
conflicts=('shaderc')
source=('git+https://github.com/google/shaderc.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd shaderc
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd shaderc
  # de-vendor libs and disable git versioning
  sed '/add_subdirectory(third_party)/d' -i CMakeLists.txt
  sed '/build-version/d' -i glslc/CMakeLists.txt
  cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q spirv-tools|cut -d \  -f 2|sed 's/-.*//')\\n"
"$(pacman -Q glslang|cut -d \  -f 2|sed 's/-.*//')\\n"
EOF

}

build() {
  CPPFLAGS="${CPPFLAGS//2/0}"

  cmake -S shaderc -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSHADERC_SKIP_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -Dglslang_SOURCE_DIR=/usr/include/glslang \
    -GNinja

  cmake --build build

  cd "${srcdir}/shaderc/glslc"
  asciidoctor -b manpage README.asciidoc -o glslc.1
}

package() {

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 -t "${pkgdir}/usr/share/man/man1/" "$srcdir/shaderc/glslc/glslc.1"
}
