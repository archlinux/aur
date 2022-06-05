# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=faustlive
pkgver=2.5.10
pkgrel=1
pkgdesc='Faust prototyping environment'
arch=(x86_64 aarch64)
url='https://github.com/grame-cncm/faustlive'
license=(GPL3)
groups=(pro-audio)
depends=(faust hicolor-icon-theme qt6-base)
makedepends=(alsa-lib cmake faust jack libmicrohttpd libsndfile)
source=("$pkgname-$pkgver.tar.gz::https://github.com/grame-cncm/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8c4c1c1b3a2dda64d7109bad701e9bdc85a424a3c5c6fb154ec94b3965b8e423')

prepare() {
  # use libraries from faust package instead of submodule
  cd $pkgname-$pkgver/Resources
  rm -r Libs
  ln -s /usr/share/faust Libs
  # https://github.com/grame-cncm/faustlive/pull/47
  cd ../Build
  sed -e 's/faustlive\/doc/doc\/faustlive/g' -i CMakeLists.txt
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
