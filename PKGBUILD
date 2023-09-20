# Maintainer: Chilledheart <hukeyue@hotmail.com>
# Contributor: Chilledheart <hukeyue@hotmail.com>

pkgname=yass-proxy-cli
pkgver=1.4.4
pkgrel=3
_pkgver=1.4.4
_pkgrel=2
pkgdesc="lightweight http/socks proxy commandline"
arch=(x86_64)
url="https://github.com/Chilledheart/yass"
license=(GPL2)
depends=(gcc-libs glibc zlib libnghttp2 c-ares)
makedepends=(git ninja perl pkg-config cmake gettext curl go clang lld llvm)
checkdepends=(curl)
provides=(yass-proxy-cli)
conflicts=(yass-proxy-cli-git)
source=("https://github.com/Chilledheart/yass/releases/download/${_pkgver}/yass-${_pkgver}.tar.gz")
sha256sums=('939967ea99fce87320aa187229615eb8c377400ea3e6be916026ef2a5e54371e')

prepare() {
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR
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
  mkdir build-linux-amd64
  cd build-linux-amd64
  cmake .. -DCLI=ON -DCMAKE_BUILD_TYPE=Release -G Ninja -DBUILD_TESTS=on \
    -DUSE_SYSTEM_ZLIB=on -DUSE_SYSTEM_CARES=on -DUSE_SYSTEM_NGHTTP2=on \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DGUI=off -DSERVER=off \
    -DUSE_LIBCXX=on -DENABLE_LTO=on
  ninja yass_cli yass_test
  llvm-objcopy --strip-debug yass_cli
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
  pushd "${srcdir}/yass-${_pkgver}"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/yass/LICENSE
  DESTDIR=${pkgdir} ninja -C build-linux-amd64 install
  popd
}
