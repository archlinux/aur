# Maintainer: Keeyou <hukeyue@vip.163.com>
# Contributor: Keeyou <hukeyue@vip.163.com>

pkgname=yass-proxy
pkgver=1.24.13
pkgrel=1
_pkgver=1.24.13
_pkgrel=1
pkgdesc="lightweight http/socks proxy"
arch=(x86_64 aarch64)
url="https://github.com/hukeyue/yass"
license=(GPL-2.0-only)
depends=(gcc-libs glibc gtk4 zlib libnghttp2 c-ares gperftools jsoncpp mbedtls)
optdepends=(gtk-update-icon-cache)
makedepends=(gcc binutils git ninja perl pkg-config cmake gettext curl go)
checkdepends=(curl)
provides=(yass-proxy)
conflicts=(yass-proxy-git)
source=("https://github.com/hukeyue/yass/releases/download/${_pkgver}/yass-${_pkgver}.tar.zst"
        "gcc16.patch"
        )
sha256sums=('43fd1af631eb67f5edebee89a7085ceacdaa2127076233eb69a3a701e5615d29'
            'a546be83afef0d46bef5b4c654f0ee731a491c4ac9643bb3be2506abd1fff05d')

prepare(){
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR
  patch -Np1 -i ../gcc16.patch
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
    -DUSE_ZLIB=on -DUSE_CARES=on \
    -DUSE_SYSTEM_ZLIB=on -DUSE_SYSTEM_CARES=on -DUSE_SYSTEM_NGHTTP2=on \
    -DUSE_JSONCPP=on -DUSE_SYSTEM_JSONCPP=on \
    -DUSE_MBEDTLS=on -DUSE_SYSTEM_MBEDTLS=on \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LIBEXECDIR=libexec \
    -DUSE_DEBUG_FISSION=off -DUSE_COMPRESS_DEBUG_SECTIONS=off \
    -DBUILD_SHARED_LIBS=on \
    -DUSE_CET=on \
    -DGUI=ON -DUSE_GTK4=on -DCLI=off -DSERVER=off
  ninja yass yass_test
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
  SRC_DIR="${srcdir}/yass-${_pkgver}"
  pushd $SRC_DIR

  install -Dm644 ./build/LICENSE ${pkgdir}/usr/share/licenses/yass/LICENSE
  DESTDIR=${pkgdir} ninja -C build install
  rm -rf ${pkgdir}/usr/share/doc

  popd
}
