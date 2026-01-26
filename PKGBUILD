# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Nils Hilbricht <nils -at- hilbricht -dot- net>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=lpd8editor
pkgver=0.0.18
pkgrel=1
pkgdesc='A Linux editor for the Akai LPD8 pad controller'
arch=(x86_64 aarch64)
url='https://github.com/charlesfleche/lpd8editor'
license=(MIT)
depends=(graphite qt6-base)
makedepends=(alsa-lib cmake qt6-svg qt6-tools)
groups=(pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/charlesfleche/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f91687707bb0a975f13320829b22b886587c7a5f8a796519bca99ff43006bc93')

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
  depends+=(libasound.so)
  DESTDIR="$pkgdir" cmake --install build-$pkgname
  cd $pkgname-$pkgver
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
