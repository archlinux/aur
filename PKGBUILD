# Maintainer: Keeyou <keeyou-cn@outlook.com>
# Contributor: Keeyou <keeyou-cn@outlook.com>

pkgname=yass-proxy-cli
pkgver=1.11.0
pkgrel=1
_pkgver=1.11.0
_pkgrel=1
pkgdesc="lightweight http/socks proxy commandline"
arch=(x86_64)
url="https://github.com/Chilledheart/yass"
license=(GPL-2.0-only)
depends=(gcc-libs glibc zlib libnghttp2 c-ares gperftools)
makedepends=(gcc binutils git ninja perl pkg-config cmake curl go)
checkdepends=(curl)
provides=(yass-proxy-cli)
conflicts=(yass-proxy-cli-git)
source=("https://github.com/Chilledheart/yass/releases/download/${_pkgver}/yass-${_pkgver}.tar.bz2"
        )
sha256sums=('860dcf98328d4988647abc2c9c79ff8b2346e1bc95dffe891a0f9fdfa1891fab')

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
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -G Ninja -DBUILD_TESTS=on \
    -DUSE_TCMALLOC=on -DUSE_SYSTEM_TCMALLOC=on \
    -DUSE_SYSTEM_ZLIB=on -DUSE_SYSTEM_CARES=on -DUSE_SYSTEM_NGHTTP2=on \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DGUI=off -DCLI=ON -DSERVER=off \
    -DUSE_LIBCXX=off -DENABLE_GOLD=off -DENABLE_LTO=off
  ninja yass_cli yass_test
  cd ..

  popd
}

check() {
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR
  ./build/yass_test
  popd
}

package(){
  pushd "${srcdir}/yass-${_pkgver}"
  DESTDIR=${pkgdir} ninja -C build install
  rm -rf ${pkgdir}/usr/share/doc
  popd
}
