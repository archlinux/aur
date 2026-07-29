# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=jnext
pkgver=0.99.74
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
sha256sums=('7e65bca0e72dcf5d02127f55b706fd335829d40a81842aa447d63b35b3a8eec5')

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
