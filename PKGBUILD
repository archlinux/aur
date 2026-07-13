# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_setPrefix="/usr"
_setLibdir="lib32"
_setFullLibdir="${_setPrefix}/${_setLibdir}"
_pkgbasename=shaderc

pkgname=lib32-$_pkgbasename
pkgver=2026.2
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation (32bit)'
url='https://github.com/google/shaderc'
arch=('x86_64')
license=('Apache-2.0')
depends=(
        "$_pkgbasename>=$pkgver"
        'lib32-glibc'
        'lib32-gcc-libs'
        'lib32-glslang'
        'lib32-spirv-tools'
        )
makedepends=(
        'cmake'
        'ninja'
        'python'
        'spirv-headers'
        )
provides=('libshaderc_shared.so')
conflicts=('lib32-shaderc-git')
source=(
        "${_pkgbasename}-${pkgver}.tar.gz::https://github.com/google/shaderc/archive/v${pkgver}/${_pkgbasename}-${pkgver}.tar.gz"
        )
sha512sums=(
        '733f85a83db4b71814c7f251c44e6010b485ed03d7e2389db5c14f8426942bebf6c95a35e5eaef80e51c29f8efa28cc0577226344630a427553200c6a87349ec'
        )
b2sums=(
        '7110c9153fd109e4c9e30fb2ae2a34afda7af7e439bf4c209063d59248fce0eb78b2a71d8335e97bbe30365bc199b1bb0d1d24c317fee2e225911cc05b94a3df'
        )

prepare() {
  cd ${_pkgbasename}-${pkgver}

  # de-vendor libs and disable git versioning
  sed '/examples/d;/third_party/d' -i CMakeLists.txt
  sed '/build-version/d' -i glslc/CMakeLists.txt
  cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q spirv-tools|cut -d \  -f 2|sed 's/-.*//')\\n"
"$(pacman -Q glslang|cut -d \  -f 2|sed 's/-.*//')\\n"
EOF
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
#  export CFLAGS+=" ${CPPFLAGS}"
#  export CXXFLAGS+=" ${CPPFLAGS} -I/usr/include/glslang"

  cd ${_pkgbasename}-${pkgver}
  cmake \
      -B build \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_INSTALL_LIBDIR="lib32" \
      -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects" \
      -DSHADERC_SKIP_TESTS=ON \
      -DPYTHON_EXECUTABLE=python \
      -Dglslang_SOURCE_DIR=/usr/include/glslang
    ninja -C build

#  cd glslc
#  asciidoctor -b manpage README.asciidoc -o glslc.1
}

check() {
  cd ${_pkgbasename}-${pkgver}
  ninja -C build test
}

package() {
  cd ${_pkgbasename}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install

  # Use the same naming scheme as the one in the lib32-shaderc-git package for coherence
  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"-32
  done

  rm -r "${pkgdir}"/usr/include
#  install -Dm 644 glslc/glslc.1 -t "${pkgdir}/usr/share/man/man1"

  # Remove unused shaderc_static.pc
  rm "${pkgdir}/usr/lib32/pkgconfig/shaderc_static.pc"

}
