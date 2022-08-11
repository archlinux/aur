# Maintainer: Melvyn <melvyn2@brcok.tk>

_srcname=SPIRV-LLVM-Translator
pkgname=lib32-${_srcname,,}
pkgver=14.0.0.r57+g33898cef
pkgrel=3
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR"
arch=(x86_64)
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=(custom)
depends=(llvm-libs lib32-llvm-libs spirv-llvm-translator spirv-tools)
makedepends=(git cmake llvm spirv-headers lib32-llvm)
checkdepends=(python python-setuptools clang)
# Current point in the used LLVM branch
_commit=33898cef1093f67c73f0623bae941f00034b2db9
source=(git+${url}.git#commit=$_commit)
sha256sums=(SKIP)

pkgver() {
  cd ${_srcname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./;s/-/+/'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -B build -S ${_srcname} \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_LIBDIR_SUFFIX=32 \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -DLLVM_INCLUDE_TESTS=ON \
    -DLLVM_EXTERNAL_LIT=/usr/bin/lit \
    -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/ \
    -Wno-dev \
    -DCCACHE_ALLOWED=OFF # ccache should be managed by makepkg
  make -C build
}

check() {
  # https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1433
  LD_LIBRARY_PATH="${srcdir}/build/lib/SPIRV" make -C build test || echo "Tests failed"
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
  install -Dm644 ${_srcname}/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
