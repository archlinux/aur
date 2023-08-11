# Maintainer: Chilledheart <hukeyue@hotmail.com>
# Contributor: Chilledheart <hukeyue@hotmail.com>

pkgname=yass-new
pkgver=1.3.14
pkgrel=1
_pkgver=1.3.14
_pkgrel=1
pkgdesc="lightweight http/socks proxy"
arch=(x86_64)
url="https://github.com/Chilledheart/yass"
license=(GPL2)
depends=(gcc-libs glibc gtk4 zlib libnghttp2 c-ares)
optdepends=(gtk-update-icon-cache)
makedepends=(git ninja perl pkg-config cmake gtk4 gettext curl go)
checkdepends=(curl)
provides=(yass)
conflicts=(yass-git)
source=("https://github.com/Chilledheart/yass/releases/download/${_pkgver}/yass-${_pkgver}.tar.gz")
sha256sums=('6e41a5244a44460ebe89545b314ca7006ea6da875342c3a600350ebda0416f5e')

prepare() {
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR
  ./scripts/download-clang-prebuilt-binaries.py
  cd tools
  go build
  cd ..
  popd
}

build(){
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR
  export CC=$PWD/third_party/llvm-build/Release+Asserts/bin/clang
  export CXX=$PWD/third_party/llvm-build/Release+Asserts/bin/clang++
  mkdir build-linux-amd64
  cd build-linux-amd64
  cmake .. -DGUI=ON -DCMAKE_BUILD_TYPE=Release -G Ninja -DBUILD_TESTS=on \
    -DUSE_SYSTEM_ZLIB=on -DUSE_SYSTEM_CARES=on -DUSE_SYSTEM_NGHTTP2=on \
    -DCMAKE_INSTALL_PREFIX=/usr -DCLI=off -DSERVER=off \
    -DUSE_LIBCXX=on -DENABLE_LTO=on
  ninja yass yass_test
  ../third_party/llvm-build/Release+Asserts/bin/llvm-objcopy --strip-debug yass
  cd ..

  popd
}

check() {
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR
  ./build-linux-amd64/yass_test
  popd
}

package(){
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/yass/LICENSE
  DESTDIR=${pkgdir} ninja -C build-linux-amd64 install

  popd
}
