# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Nils Hilbricht <nils -at- hilbricht -dot- net>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=lpd8editor
pkgver=0.0.16
pkgrel=1
pkgdesc='A Linux editor for the Akai LPD8 pad controller'
arch=(x86_64 aarch64)
url='https://github.com/charlesfleche/lpd8editor'
license=(MIT)
depends=()
makedepends=(alsa-lib cmake qt5-base qt5-svg qt5-tools)
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/charlesfleche/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b9709e014102b65711825488d9f081edb40e18c1b316c0ebd5b0248f6728201')

prepare() {
  cd $pkgname-$pkgver
  # by default checks for version using git and hardcoded string
  sed -e '/Git REQUIRED/d' \
    -e '/set.LPD8EDITOR_QAPPLICATION_VERSION/d' \
    -i CMakeLists.txt
}

build() {
  cmake -B build-$pkgname -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_PROJECT_VERSION=$pkgver \
    -DLPD8EDITOR_QAPPLICATION_VERSION=$pkgver \
    -DGIT_EXECUTABLE=false \
    -Wno-dev
  cmake --build build-$pkgname
}

package() {
  depends+=(libasound.so libQt5Sql.so libQt5Widgets.so libQt5Gui.so libQt5Core.so)
  DESTDIR="$pkgdir" cmake --install build-$pkgname
  cd $pkgname-$pkgver
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
