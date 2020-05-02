# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_setPrefix="/usr"
_setLibdir="lib32"
_setFullLibdir="${_setPrefix}/${_setLibdir}"
_pkgbasename=shaderc

pkgname=lib32-$_pkgbasename
pkgver=2020.0
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation (32bit)'
url='https://github.com/google/shaderc'
arch=('x86_64')
license=('Apache')
depends=("$_pkgbasename"
        'lib32-glibc'
        'lib32-gcc-libs'
        'lib32-glslang>=8.13.3559'
        'lib32-spirv-tools>=2019.5'
        'spirv-tools>=2019.5'
        )
makedepends=(
        'cmake'
        'ninja'
        'python'
        'spirv-headers'
        )
provides=('libshaderc_shared.so')
source=(
        "${_pkgbasename}-${pkgver}.tar.gz::https://github.com/google/shaderc/archive/v${pkgver}.tar.gz"
        )
sha512sums=(
        '1971673d7a5fe77ef827c29db14112d4935c573c7c4f3b00fff3729334284d11640ee40c9e97ebcb2a14c6d5c6db0cf5e2ef6b2dfb59c759d1322c6d38624eb4'
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
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS} -I/usr/include/glslang"

  cmake \
      -B build \
      -S ${_pkgbasename}-${pkgver} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_INSTALL_LIBDIR="lib32" \
      -DSHADERC_SKIP_TESTS=ON \
      -G Ninja
    ninja -C build

#  cd ${_pkgbasename}-${pkgver}/glslc
#  asciidoctor -b manpage README.asciidoc -o glslc.1
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf ${_pkgbasename}-${pkgver}/${pkgdir}/usr/{include,share,bin}
#  install -Dm 644 ${_pkgbasename}-${pkgver}/glslc/glslc.1 -t "${pkgdir}/usr/share/man/man1"
}
