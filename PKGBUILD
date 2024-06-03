# Maintainer: Keeyou <keeyou-cn@outlook.com>
# Contributor: Keeyou <keeyou-cn@outlook.com>

pkgname=yass-proxy-cli
pkgver=1.10.5
pkgrel=2
_pkgver=1.10.5
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
