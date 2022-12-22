# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=faustlive
pkgver=2.5.13
pkgrel=1
pkgdesc='Faust prototyping environment'
arch=(x86_64 aarch64)
url='https://github.com/grame-cncm/faustlive'
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme qt6-base)
makedepends=(alsa-lib cmake faust jack libmicrohttpd libsndfile)
source=("$pkgname-$pkgver.tar.gz::https://github.com/grame-cncm/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('46e65b81ad0811ce4758e4c31edec7706bfcf60595cf260347ea5594ee7c7c6a')

prepare() {
  # use libraries from faust package instead of submodule
  cd $pkgname-$pkgver/Resources
  rm -r Libs
  ln -s /usr/share/faust Libs
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
