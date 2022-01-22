# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clightd-git
pkgver=5.5.r1.g664fb26
pkgrel=2
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/Clightd"
license=('GPL')
depends=('systemd-libs>=237' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit'
         'ddcutil>=0.9.5' 'libmodule>=5.0.0' 'libjpeg-turbo' 'libusb' 'libdrm' 'wayland')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/FedeDP/Clightd.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/"${pkgname%-git}" \
    -DENABLE_DDC=1 \
    -DENABLE_GAMMA=1 \
    -DENABLE_DPMS=1 \
    -DENABLE_SCREEN=1 \
    -DENABLE_YOCTOLIGHT=1 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
