# Maintainer: Chilledheart <hukeyue@hotmail.com>
# Contributor: Chilledheart <hukeyue@hotmail.com>

pkgname=yass-proxy-git
pkgver=1.12.1.r1.g6d8bf7d6
pkgrel=1
pkgdesc="lightweight http/socks proxy"
arch=(i686 x86_64)
url="https://github.com/Chilledheart/yass"
license=('GPL 2.0')
depends=(gcc-libs glibc gtk3 zlib libnghttp2 c-ares gperftools)
optdepends=(gtk-update-icon-cache libappindicator-gtk3 libayatana-appindicator)
makedepends=(gcc binutils git ninja perl pkg-config cmake gettext curl go)
checkdepends=(curl)
provides=(yass-proxy)
conflicts=(yass-proxy)
source=("git+https://github.com/Chilledheart/yass.git")
sha256sums=('SKIP')

prepare() {
  SRC_DIR="${srcdir}/yass"
  cd "$SRC_DIR"
  git submodule update --init
}

pkgver() {
  SRC_DIR="${srcdir}/yass"
  cd "$SRC_DIR"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  SRC_DIR="${srcdir}/yass"
  pushd $SRC_DIR
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -G Ninja -DBUILD_TESTS=on \
    -DUSE_TCMALLOC=on -DUSE_SYSTEM_TCMALLOC=on \
    -DUSE_ZLIB=on -DUSE_CARES=on \
    -DUSE_SYSTEM_ZLIB=on -DUSE_SYSTEM_CARES=on -DUSE_SYSTEM_NGHTTP2=on \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DGUI=ON -DUSE_GTK4=off -DCLI=off -DSERVER=off
  ninja yass yass_test
  cd ..

  popd
}

check() {
  SRC_DIR="${srcdir}/yass"
  pushd $SRC_DIR
  ./build/yass_test
  popd
}

package(){
  SRC_DIR="${srcdir}/yass"
  pushd $SRC_DIR

  install -Dm644 ./build/LICENSE ${pkgdir}/usr/share/licenses/yass/LICENSE
  DESTDIR=${pkgdir} ninja -C build install
  rm -rf ${pkgdir}/usr/share/doc

  popd
}
