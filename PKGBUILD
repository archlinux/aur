# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=faustlive
pkgver=2.5.16
pkgrel=1
pkgdesc='Faust prototyping environment'
arch=(x86_64 aarch64)
url='https://github.com/grame-cncm/faustlive'
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme qt6-base)
makedepends=(alsa-lib cmake faust jack libmicrohttpd libsndfile)
source=("$pkgname-$pkgver.tar.gz::https://github.com/grame-cncm/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('73ad19153b1cb0d0b70871ffd8833d62bebc34812207faf9cce7ca05aac9d5b2')

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
