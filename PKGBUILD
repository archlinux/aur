# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Tri Le <trile7@gmail.com>

pkgname=mjpg-streamer-git
epoch=1
pkgver=1.0.0.r1.g310b29f
pkgrel=1
pkgdesc="Stream mjpeg frames from a webcam via http"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/jacksonliam/mjpg-streamer"
license=(GPL2)
depends=(libjpeg-turbo imagemagick)
provides=(mjpg-streamer)
conflicts=(mjpg-streamer)
makedepends=(git cmake protobuf-c zeromq sdl libgphoto2 v4l-utils python-numpy)
source=("git+https://github.com/jacksonliam/mjpg-streamer.git")
sha256sums=(SKIP)

export LDFLAGS="-Wl,-O1,--sort-common,--no-as-needed,-z,relro,-z,now"
export CFLAGS="-fcommon"

pkgver() {
  cd "${pkgname/-git/}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname/-git/}/mjpg-streamer-experimental"
  install -d _build
}

build() {
  cd "${pkgname/-git/}/mjpg-streamer-experimental/_build"
  cmake .. -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_INPUT_OPENCV=OFF \
    -DENABLE_HTTP_MANAGEMENT=ON \
    -DWXP_COMPAT=ON \
    -DCMAKE_BUILD_TYPE=release
}

package() {
  cd "${pkgname/-git/}/mjpg-streamer-experimental"
  make DESTDIR="${pkgdir}" install
}
