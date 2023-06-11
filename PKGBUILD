# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clightd-git
pkgver=5.8.r2.gf57b330
pkgrel=1
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/Clightd"
license=('GPL')
depends=('systemd-libs' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit'
         'ddcutil' 'libmodule' 'libjpeg-turbo' 'libusb' 'libdrm' 'wayland')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/FedeDP/Clightd.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Clightd"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S Clightd \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/"${pkgname%-git}" \
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
