# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bespokesynth
pkgname=bespokesynth-git
pkgver=1.0.0.r250.ge424a8e
pkgrel=1
pkgdesc="A software modular synth"
arch=('x86_64')
url="https://www.bespokesynth.com/"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libpng'
'python' 'zenity' 'zlib')
makedepends=('alsa-lib' 'cmake' 'flac' 'freetype2' 'git' 'jack' 'jsoncpp'
'juce' 'libusb' 'libvorbis' 'libx11' 'libxcursor' 'libxinerama' 'pybind11'
'tuning-library' 'xorg-xrandr')
conflicts=('bespokesynth')
provides=('bespokesynth')
source=(
  "$pkgname::git+https://github.com/${_name}/${_name}"
  "MTS-ESP::git+https://github.com/ODDSound/MTS-ESP"
  "${_name}-1.0.0.r246.gfd389e6-devendoring.patch"
)
sha512sums=('SKIP'
            'SKIP'
            '21bae6e78694f742d0e8aa07a2e570f558675bf0fc7358956a9ddd604be0e94c73e6d4a3405e91a2f97cc4bbafdb2f7d1e70297fafabc6622b7690893dce8e33')
b2sums=('SKIP'
        'SKIP'
        'a24bf808e4855038ab29ef854d2e40c6d310dd52e825d54f42f4f59431d8fc38ba856b25a7c92fb34728b09d23f85421b1a29695c40711ae5b7d7d2297859d13')
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

  patch -Np1 -i ../"${_name}-1.0.0.r246.gfd389e6-devendoring.patch"
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DBESPOKE_JUCE_LOCATION=/usr/share/juce/ \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=('libasound.so' 'libFLAC.so' 'libfreetype.so' 'libjpeg.so'
  'libjsoncpp.so' 'libogg.so' 'libusb-1.0.so' 'libvorbis.so' 'libvorbisenc.so'
  'libvorbisfile.so')

  cd "$pkgname"
  make DESTDIR="$pkgdir/" install -C build
}
