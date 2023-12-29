# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-rtspserver
pkgver=3.1.0
pkgrel=1
pkgdesc="This is a plugin for obs-studio, encoding the output and publish rtsp stream"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-rtspserver.1037/"
license=("GPL2")
depends=("obs-studio>=30" "gcc-libs" "glibc" "qt6-base")
makedepends=("cmake" "git")
source=(
  "$pkgname::git+https://github.com/iamscottxu/obs-rtspserver.git#tag=v$pkgver"
  "libb64::git+https://github.com/libb64/libb64.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
)

prepare() {
  cd $pkgname

  git config submodule.rtsp-server/3rdpart/libb64/libb64.url $srcdir/libb64
  git -c protocol.file.allow=always submodule update rtsp-server/3rdpart/libb64/libb64

  sed -i '1s/^/#include <cstdlib>\n/' rtsp-server/net/MemoryManager.cpp
  sed -i '1s/^/#include <string>\n/' rtsp_output_helper.h
}

build() {
  cd "$pkgname"

  cmake -B build \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -Wno-dev \
  -DLIBOBS_INCLUDE_DIR=/usr/include/obs \
  -DOBS_FRONTEND_API_INCLUDE_DIR=/usr/include/obs

  make -C build VERBOSE=1
}

package() {
  mkdir -p $pkgdir/usr/

  cd $pkgname

  make -C build install

  cp -a release/* $pkgdir/usr/
}
