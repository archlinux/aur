# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-rtspserver
pkgver=3.0.0
pkgrel=1
pkgdesc="This is a plugin for obs-studio, encoding the output and publish rtsp stream"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-rtspserver.1037/"
license=("GPL2")
depends=("obs-studio>=29")
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
}

build() {
  cd "$pkgname"

  cmake -B build \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DLIBOBS_INCLUDE_DIR=/usr/include/obs \
  -DOBS_FRONTEND_API_INCLUDE_DIR=/usr/include/obs

  make -C build
}

package() {
  mkdir -p $pkgdir/usr/
  mkdir -p $pkgdir/usr/

  cd $pkgname

  _fake_install_dir="$srcdir/plugin-install"

  make -C build DESTDIR="$_fake_install_dir/" install

  cp -a $_fake_install_dir/build/$pkgname/src/$pkgname/release/* $pkgdir/usr/

  rm -rf $_fake_install_dir
}
