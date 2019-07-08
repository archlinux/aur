_pkgname=shaderc
pkgname="mingw-w64-${_pkgname}"
pkgver=2018.0
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation (mingw-w64)'
url='https://github.com/google/shaderc'
arch=('any')
license=('Apache')
depends=()
makedepends=('mingw-w64-cmake' 'mingw-w64-spirv-tools' 'mingw-w64-glslang')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/google/shaderc/archive/v${pkgver}.tar.gz
        'fix-glslang-link-order.patch::https://github.com/google/shaderc/pull/463/commits/21c8be385b3fab5edcb934a6d99f69fd389c4e67.patch')
sha512sums=('7a420fde73c9f2aae3f13558d538a1f4ae43bba19e2b4d2da8fbbd017e9e4f328ece5f330f1bbcb9fe84c91b7eb84b9158dc2e3d144c82939090a0fa6f5b4ef0'
            '995297afe2f70086fb5a68e19c8b2e958812dca77e400c7697adaa8b8dbaee62a2f6784794c5a838a1bae96ab71fd3b72d2a50424512f52ee7f324f629e7b390')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# https://github.com/gentoo/gentoo/blob/c31d001aeedaf97917fa29fa859e16090cc50282/media-libs/shaderc/shaderc-2017.2.ebuild#L35-L65
prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 < ../fix-glslang-link-order.patch

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
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DSHADERC_SKIP_TESTS=ON \
      -DSHADERC_ENABLE_NV_EXTENSIONS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/$_pkgname-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et:
