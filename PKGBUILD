# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=clementine
pkgver=1.4.0rc2
pkgrel=6
pkgdesc='A modern music player and library organizer'
url=https://www.clementine-player.org/
license=(GPL)
arch=(x86_64)
depends=(chromaprint gst-plugins-base-libs libcdio libgpod liblastfm-qt5 libmtp libmygpo-qt5
         protobuf qt5-x11extras projectm alsa-lib libpulse crypto++ hicolor-icon-theme)
makedepends=(boost cmake qt5-tools sparsehash)
optdepends=(
  'gst-plugins-base: "Base" plugin libraries'
  'gst-plugins-good: "Good" plugin libraries'
  'gst-plugins-bad: "Bad" plugin libraries'
  'gst-plugins-ugly: "Ugly" plugin libraries'
  'gst-libav: Libav plugin'
  'gvfs: Various devices support'
)
source=(https://github.com/clementine-player/Clementine/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('2395efdef013aa65ec8b8521d549bf76dbde4f933867be3953f31553101ead63')

prepare() {
  sed -e 's|CRYPTOPP cryptopp|CRYPTOPP libcryptopp|' -i Clementine-${pkgver//+/-}/CMakeLists.txt # Fix crypto++ detection
}

build() {
  export LDFLAGS="-Wl,--copy-dt-needed-entries"
  cmake -B build -S Clementine-${pkgver//+/-} -Wno-dev \
    -DCMAKE_CXX_FLAGS="-fpermissive" \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_PROJECTM=ON \
    -DUSE_SYSTEM_TAGLIB=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
