# Maintainer: Keeyou <keeyou-cn@outlook.com>
# Contributor: Keeyou <keeyou-cn@outlook.com>

pkgname=yass-proxy-gtk3
pkgver=1.10.5
pkgrel=1
_pkgver=1.10.5
_pkgrel=1
pkgdesc="lightweight http/socks proxy"
arch=(x86_64)
url="https://github.com/Chilledheart/yass"
license=(GPL-2.0-only)
depends=(gcc-libs glibc gtk3 zlib libnghttp2 c-ares gperftools)
optdepends=(gtk-update-icon-cache)
makedepends=(git ninja perl pkg-config cmake gtk3 gettext curl go clang lld llvm gperftools)
checkdepends=(curl)
provides=(yass-proxy)
conflicts=(yass-proxy-git yass-proxy-qt6 yass-proxy)
source=("https://github.com/Chilledheart/yass/releases/download/${_pkgver}/yass-${_pkgver}.tar.bz2"
        "libcxx-gcc-14.patch"
        )
sha256sums=('0b94788d253a4437fa632ddcce4dd283537934eb036b590bb2691ad8824c408d'
            '72f55c55adb141d31dd9cd892cd04a08df2d95a1d94ad3a4b421a312075782e4'
            )

prepare() {
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR
  patch --forward --strip=1 --input=../libcxx-gcc-14.patch
  cd tools
  go build
  cd ..
  popd
}

build(){
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR
  export CC=clang
  export CXX=clang++
  rm -rf build-linux-amd64
  mkdir build-linux-amd64
  cd build-linux-amd64
  cmake .. -DCMAKE_BUILD_TYPE=Release -G Ninja -DBUILD_TESTS=on \
    -DUSE_TCMALLOC=on -DUSE_SYSTEM_TCMALLOC=on \
    -DUSE_SYSTEM_ZLIB=on -DUSE_SYSTEM_CARES=on -DUSE_SYSTEM_NGHTTP2=on \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGUI=ON -DUSE_GTK4=off -DCLI=off -DSERVER=off \
    -DUSE_LIBCXX=off -DENABLE_LTO=on
  ninja yass yass_test
  llvm-objcopy --strip-debug yass
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

  install -Dm644 ./build-linux-amd64/LICENSE ${pkgdir}/usr/share/licenses/yass/LICENSE
  DESTDIR=${pkgdir} ninja -C build-linux-amd64 install
  rm -rf ${pkgdir}/usr/share/doc

  popd
}
