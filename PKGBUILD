# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=jnext
pkgver=0.99.0
pkgrel=1
pkgdesc="A ZX Spectrum Next emulator using VHDL sources as a reference"
arch=('x86_64')
depends=(sdl2 qt6-base hicolor-icon-theme)
makedepends=(cmake git libpng)
optdepends=('ffmpeg: video recording support')
url="https://github.com/jorgegv/jnext"
license=('GPL-3.0-only')
options=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('68f4e19f48aa46f38e67e7416bb9215f3a16c41770846835a6411aab0138b51c')

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
