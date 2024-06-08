# Maintainer: XenHat <me at xenh.at>
# Contributors: SoftwareRat <jaguar5018@gmail.com>, Michael Herzberg

pkgname=moonlight-qt-git
pkgver=v6.0.0.r2.g486c4678
pkgrel=1
pkgdesc='GameStream client for PCs (Windows, Mac, and Linux) (master branch)'
arch=('aarch64' 'x86_64')
license=('GPL')
url='https://moonlight-stream.org'
depends=('qt6-base' 'qt5-quickcontrols2' 'qt6-svg' 'qt6-wayland' 'ffmpeg' 'sdl2_ttf' 'wayland-protocols' 'opus')
makedepends=('git' 'pkg-config' 'vulkan-headers' 'libplacebo' 'libvdpau' 'ffmpeg' 'qt6-declarative')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+https://github.com/moonlight-stream/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
  qmake PREFIX="$pkgdir/usr" moonlight-qt.pro
}

build() {
  cd "$pkgname"
  make -j$(nproc)
}

package() {
  cd "$pkgname"
  make install
}
