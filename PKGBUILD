# Maintainer: Joelton D. Brandão <joeltondbrandao at freedxm dot com>

pkgname=capture-view-git
_pkgname=capture-view
pkgver=0.2.1.r5.g05368a3
pkgrel=1
pkgdesc='Native low-latency HDMI USB capture-card viewer for Linux'
arch=('x86_64')
url='https://github.com/D35P4C1T0/capture-view'
license=('MIT' 'OFL-1.1')
depends=(
  'ffmpeg'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libjpeg-turbo'
  'libstdc++'
  'pipewire'
  'sdl3'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'pkgconf'
)
optdepends=(
  'v4l-utils: V4L2 device inspection and manual configuration tools'
  'v4l2loopback-dkms: optional virtual camera output support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
