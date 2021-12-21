# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bespokesynth
pkgname=bespokesynth-git
pkgver=1.1.0.r42.gf93ce26
pkgrel=1
pkgdesc="A software modular synth"
arch=(x86_64)
url="https://www.bespokesynth.com/"
license=(GPL3)
depends=(gcc-libs glibc hicolor-icon-theme libglvnd libpng python zenity zlib)
makedepends=(alsa-lib cmake flac freetype2 git jack jsoncpp juce libusb
libvorbis libx11 libxcursor libxinerama pybind11 tuning-library xorg-xrandr)
conflicts=(bespokesynth)
provides=(bespokesynth)
source=(
  "$pkgname::git+https://github.com/${_name}/${_name}"
  "MTS-ESP::git+https://github.com/ODDSound/MTS-ESP"
)
sha512sums=('SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP')
validpgpkeys=()

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.libs/oddsound-mts/MTS-ESP.url "${srcdir}/MTS-ESP"
  git submodule deinit libs/JUCE
  git submodule deinit libs/pybind11
  git submodule deinit libs/tuning-library
  git submodule deinit libs/json/jsoncpp
  git submodule update
}

pkgver() {
  cd "$pkgname"
  git describe --exclude Nightly --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DBESPOKE_SYSTEM_PYBIND11=ON \
        -DBESPOKE_SYSTEM_JSONCPP=ON \
        -DBESPOKE_SYSTEM_TUNING_LIBRARY=ON \
        -DBESPOKE_SYSTEM_JUCE=ON \
        -DBESPOKE_DEVENDORED_SYSTEM_JUCE=ON \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=(libasound.so libFLAC.so libfreetype.so libjpeg.so libjsoncpp.so
  libogg.so libusb-1.0.so libvorbis.so libvorbisenc.so libvorbisfile.so)

  cd "$pkgname"
  make DESTDIR="$pkgdir/" install -C build
}
