# Maintainer: badcast <lmecomposer@gmail.com>

_pkgbase=adskiller
pkgname=$_pkgbase-desktop
pkgver=1.3.13
pkgrel=1
pkgdesc="Client for Android/iOS cleaner and multi-tool GUI utility"
arch=('x86_64')
url="https://github.com/badcast/$_pkgbase"
license=('GPL-3.0-only')
depends=('glibc' 'qt6-base')
makedepends=('cmake' 'gcc')
optdepends=(
  'android-tools: Android support'
  'libimobiledevice: iOS support'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "$_pkgbase-gui.desktop"
  "$_pkgbase-gui-desktop.png"
)
sha256sums=('1f6b4e56f82068700f176955687ae3bea421186d00e9e69876ebe171ff7d52d0'
            '8e4a856343906a93e7b5196dd3d91e2be6add4f10c4694b0bfec9fa68f4ff151'
            '7fe93ed4e349b7904e28e3c4a83934a143858105c91fa3c0c3bbaf5de8e43d9f')

build() {
  cd "$_pkgbase-$pkgver"

  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNREMOTEADDR="https://adskiller.imister.tech/api"
  cmake --build build
}

package() {
  cd "$_pkgbase-$pkgver"

  install -Dm755 "build/$_pkgbase" "$pkgdir/usr/bin/$_pkgbase-gui"
  mkdir -p "$pkgdir/usr/lib"
  find build -name "libpixelblast.so*" -exec cp -a "{}" "$pkgdir/usr/lib/" \;
  install -Dm644 "$srcdir/$_pkgbase-gui.desktop" "$pkgdir/usr/share/applications/$_pkgbase-gui.desktop"
  install -Dm644 "$srcdir/$_pkgbase-gui-desktop.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgbase-gui-desktop.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
