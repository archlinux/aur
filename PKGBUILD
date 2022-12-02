# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=mjpg-streamer
pkgver=1.0.1
pkgrel=1
pkgdesc="Stream mjpeg frames from a webcam via http"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/jacksonliam/mjpg-streamer"
license=(GPL2)
depends=(protobuf-c zeromq sdl12-compat libgphoto2 v4l-utils)
makedepends=(cmake python-numpy)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LMBernardo/mjpg-streamer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1a0254a039ec0b415e45ea8cf08ec99b574cc1a2a3253afe6cde3dc360a94395')

export LDFLAGS="-Wl,-O1,--sort-common,--no-as-needed,-z,relro,-z,now"
export CFLAGS="-fcommon"

prepare() {
  cd "${pkgname}-${pkgver}/mjpg-streamer-experimental"
  install -d _build
}

build() {
  cd "${pkgname}-${pkgver}/mjpg-streamer-experimental/_build"
  cmake .. -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_INPUT_OPENCV=OFF \
    -DENABLE_HTTP_MANAGEMENT=OFF \
    -DWXP_COMPAT=ON \
    -DCMAKE_BUILD_TYPE=release
}

package() {
  cd "${pkgname}-${pkgver}/mjpg-streamer-experimental"
  make DESTDIR="${pkgdir}" install
}
