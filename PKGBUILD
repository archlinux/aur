# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=jnext
pkgver=1.1.23
pkgrel=1
pkgdesc="A ZX Spectrum Next emulator using VHDL sources as a reference"
arch=('x86_64')
depends=(sdl3 qt6-base hicolor-icon-theme)
makedepends=(cmake git libpng)
optdepends=('ffmpeg: video recording support')
url="https://github.com/jorgegv/jnext"
license=('GPL-3.0-only')
options=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('94eef528345ba3d56e66d77159363686dec804cf1ebb4312c05ef89c6c734c4b')

prepare() {
  cd $pkgname-$pkgver/third_party/

  git clone https://github.com/gabime/spdlog.git
}

build() {
   cmake -B build-gui -S $pkgname-$pkgver \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_BUILD_TYPE=Release \
         -DENABLE_QT_UI=ON \
         -DENABLE_TESTS=OFF

   cmake -B build-sdl -S $pkgname-$pkgver \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_BUILD_TYPE=Release \
         -DENABLE_TESTS=OFF

   make -C build-gui
   make -C build-sdl
}

package() {
   DESTDIR="$pkgdir" cmake --install build-gui
   mv build-sdl/jnext "$pkgdir"/usr/bin/jnext-sdl
}
