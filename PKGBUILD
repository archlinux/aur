# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=mjpg-streamer
pkgver=1.0.0
pkgrel=1
pkgdesc="Stream mjpeg frames from a webcam via http"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/jacksonliam/mjpg-streamer"
license=(GPL2)
depends=(libjpeg-turbo imagemagick)
makedepends=(cmake protobuf-c zeromq sdl libgphoto2 v4l-utils python-numpy)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jacksonliam/mjpg-streamer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('31850cd533b0290640cbdf4da44f7a774bfba050647cb0a0c84a435e90b08598')

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
    -DENABLE_HTTP_MANAGEMENT=ON \
    -DWXP_COMPAT=ON \
    -DCMAKE_BUILD_TYPE=release
}

package() {
  cd "${pkgname}-${pkgver}/mjpg-streamer-experimental"
  make DESTDIR="${pkgdir}" install
}
