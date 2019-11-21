# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_setPrefix="/usr"
_setLibdir="lib32"
_setFullLibdir="${_setPrefix}/${_setLibdir}"
_pkgbasename=shaderc

pkgname=lib32-$_pkgbasename
pkgver=2019.0
pkgrel=2
pkgdesc='Collection of tools, libraries and tests for shader compilation (32bit)'
url='https://github.com/google/shaderc'
arch=('x86_64')
license=('Apache')
depends=("$_pkgbasename"
        'lib32-glibc'
        'lib32-gcc-libs'
        'lib32-glslang>=7.13.3496'
        'lib32-spirv-tools>=2019.3'
        )
makedepends=(
        'cmake'
        'ninja'
        'python'
        )
provides=('libshaderc_shared.so')
source=("${_pkgbasename}-${pkgver}.tar.gz::https://github.com/google/shaderc/archive/v${pkgver}.tar.gz"
        'fix-glslang-link-order.patch::https://github.com/google/shaderc/pull/463/commits/21c8be385b3fab5edcb934a6d99f69fd389c4e67.patch'
        'shaderc-2019.0-fix-build-against-new-glslang.patch')
sha512sums=('c76887ad0a96145211b6550b0dfe63091df9e1463f9a3140aba2d1982c33e98ad14fb4bcf9ce2281433fc77626fc892c268d0636b9f348a159dd06e3f41b461a'
            '995297afe2f70086fb5a68e19c8b2e958812dca77e400c7697adaa8b8dbaee62a2f6784794c5a838a1bae96ab71fd3b72d2a50424512f52ee7f324f629e7b390'
            '96d2e6a67a8c38e374b56b16936574e374592eec6b38b2a4fd35ae80419298196a849bfbacc5bf7f1b6175c417ead469b18d2c196147119e490556d49eebc89f')

# https://github.com/gentoo/gentoo/blob/c31d001aeedaf97917fa29fa859e16090cc50282/media-libs/shaderc/shaderc-2017.2.ebuild#L35-L65
prepare() {
  mkdir -p ${_pkgbasename}-${pkgver}/build

  cd ${_pkgbasename}-${pkgver}
  patch -Np1 < ../fix-glslang-link-order.patch
  patch -Np1 < ../shaderc-2019.0-fix-build-against-new-glslang.patch

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
  export CXXFLAGS+=" -I/usr/include/glslang"

  cd ${_pkgbasename}-${pkgver}/build
  cmake .. \
      -G Ninja \
      -DCMAKE_LIBRARY_PATH="/usr/lib32" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DBUILD_DOC=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR="lib32" \
      -DSHADERC_SKIP_TESTS=ON \
      -DSHADERC_ENABLE_NV_EXTENSIONS=OFF # Currently requires glslang-git
    ninja

#  cd ../glslc
#  asciidoctor -b manpage README.asciidoc -o glslc.1
}

package() {
  cd ${_pkgbasename}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  rm -rf "$pkgdir"/usr/{include,share,bin}
#  install -Dm 644 glslc/glslc.1 -t "${pkgdir}/usr/share/man/man1"
}
