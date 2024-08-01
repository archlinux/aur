# Maintainer: Keeyou <keeyou-cn@outlook.com>
# Contributor: Keeyou <keeyou-cn@outlook.com>

pkgname=yass-proxy-cli
pkgver=1.12.1
pkgrel=2
_pkgver=1.12.1
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
        "cet.patch"
        )
sha256sums=('dfb55663d256816fbe468a8e82a8ea8ab626960b4b6a48a2a0846961daf69dbc'
            'cd787d5a40f5aa6025e083e1bbe6225093a8d21d3f60d707cd29eb290949f159')

prepare(){
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR
  patch -Np1 -i ../cet.patch
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
    -DUSE_CET=on \
    -DGUI=off -DCLI=ON -DSERVER=off
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
