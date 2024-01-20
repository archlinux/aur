# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clightd-git
pkgver=5.8.r9.g7d447d0
pkgrel=1
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/Clightd"
license=('GPL-3.0-or-later')
depends=(
  'ddcutil'
  'libdrm'
  'libiio'
  'libjpeg-turbo'
  'libmodule'
  'libusb'
  'libx11'
  'libxext'
  'linux-api-headers'
  'libxrandr'
  'polkit'
  'systemd-libs'
  'wayland'
)
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/FedeDP/Clightd.git')
sha256sums=('SKIP')

pkgver() {
  cd Clightd
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S Clightd \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname%-git}" \
    -DENABLE_DDC='1' \
    -DENABLE_GAMMA='1' \
    -DENABLE_DPMS='1' \
    -DENABLE_SCREEN='1' \
    -DENABLE_YOCTOLIGHT='1' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
