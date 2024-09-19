# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=faustlive
pkgver=2.5.19
pkgrel=1
pkgdesc='Faust prototyping environment'
arch=(aarch64 x86_64)
url='https://github.com/grame-cncm/faustlive'
license=(GPL-3.0-only)
groups=(pro-audio)
depends=(hicolor-icon-theme qt6-base)
makedepends=(alsa-lib cmake faust jack libmicrohttpd libsndfile)
source=("$pkgname-$pkgver.tar.gz::https://github.com/grame-cncm/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('11d5c57fd0e646d8e21415f5450df75a83cdc67f89f8fc8acb532ce849ee26ec')

prepare() {
  # use libraries from faust package instead of submodule
  cd $pkgname-$pkgver
  rm -r Resources/Libs
  ln -s /usr/share/faust Resources/Libs
}

build() {
  cmake -B build -S $pkgname-$pkgver/Build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=ON \
    -Wno-dev
  cmake --build build
}

package() {
  depends+=(libasound.so libcurl.so libfaust.so libHTTPDFaust.so libjack.so libmicrohttpd.so
    libOSCFaust.so libsndfile.so)
  DESTDIR="$pkgdir" cmake --install build
}
