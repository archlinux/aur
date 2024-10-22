# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=clementine
pkgver=1.4.1+10+gefe886e0a
pkgrel=1
pkgdesc='A modern music player and library organizer'
arch=(x86_64)
url="https://github.com/clementine-player/Clementine"
license=(GPL-3.0-or-later)
depends=(chromaprint gst-plugins-base-libs libcdio libgpod liblastfm-qt5 libmtp libmygpo-qt5
         protobuf qt5-x11extras projectm alsa-lib libpulse hicolor-icon-theme

         # namcap implicit depends
         zlib glib2 sqlite libx11 gstreamer glibc gcc-libs abseil-cpp qt5-base fftw

         libprotobuf.so)
makedepends=(git boost cmake qt5-tools sparsehash)
optdepends=(
  'gst-plugins-base: "Base" plugin libraries'
  'gst-plugins-good: "Good" plugin libraries'
  'gst-plugins-bad: "Bad" plugin libraries'
  'gst-plugins-ugly: "Ugly" plugin libraries'
  'gst-libav: Libav plugin'
  'gvfs: Various devices support')
source=("git+https://github.com/clementine-player/Clementine.git#commit=efe886e0aeb3684a48a6b3e6070ded62286a208a")
sha256sums=('f3974454589f7554661f5656a56aa29c1a84fa5dad981db2c03204c964a55148')

pkgver() {
  cd Clementine
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  # fail with talib 2.0 https://github.com/clementine-player/Clementine/issues/7313

  export LDFLAGS="-Wl,--copy-dt-needed-entries"

  local _flags=(
    -DCMAKE_CXX_FLAGS="-fpermissive"
    -DCMAKE_CXX_STANDARD=17
    -DUSE_SYSTEM_PROJECTM=ON
    -DUSE_SYSTEM_TAGLIB=OFF
  )

  cmake -B build -S "Clementine" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
