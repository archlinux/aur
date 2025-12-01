# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fishui
pkgver=0.8
pkgrel=4
pkgdesc="GUI library based on QQC2 for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/fishui"
license=('GPL-3.0-or-later')
depends=('kwindowsystem5' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/fishui/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        0001-Add-Wayland-support.patch)
sha512sums=('9cfbf51901aa79341b66bdbd21f87b480ec9a6640aec09f56e9e046b5aa88ee05a890c1872ac47bed1eb053b9ce958d189b7e9287908708e7bed6ae5f0946cb6'
            '8cadb8d05e7862f96f5a213adabc53b327af7b5a47ad4cd0c3ccb7c1ed6cd112e9c8819d894de4f5b0d2a6c6d5d229a94652a5e74d1b8bb4e4a6d48cdd08dc0d')

prepare() {
  cd $pkgname-$pkgver

  # Add Wayland support
  patch -p1 -i ../0001-Add-Wayland-support.patch

  # Disable layer effect when the Qt Quick software backend is used
  sed -i 's/layer\.enabled: true/layer.enabled: GraphicsInfo.api !== GraphicsInfo.Software/
          s/layer\.enabled: FishUI\.Theme\.darkMode/layer.enabled: GraphicsInfo.api !== GraphicsInfo.Software \&\& FishUI.Theme.darkMode/
          s/layer\.enabled: _background\.radius > 0/layer.enabled: GraphicsInfo.api !== GraphicsInfo.Software \&\& _background.radius > 0/' src/*/*.qml
}

build() {
  cmake -G Ninja -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
