# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bespokesynth
pkgname=bespokesynth-git
pkgver=1.0.0.r117.gb9d6dc3
pkgrel=2
pkgdesc="A software modular synth"
arch=('x86_64')
url="https://www.bespokesynth.com/"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libpng' 'python'
'zlib')
makedepends=('alsa-lib' 'cmake' 'flac' 'freetype2' 'git' 'jack' 'juce' 'libusb'
'libvorbis' 'libx11' 'libxcursor' 'libxinerama' 'pybind11' 'tuning-library'
'xorg-xrandr')
conflicts=('bespokesynth')
provides=('bespokesynth')
source=(
  "$pkgname::git+https://github.com/${_name}/${_name}"
  "MTS-ESP::git+https://github.com/ODDSound/MTS-ESP"
  "${_name}-1.0.0.r117.gb9d6dc3-remove_vendoring.patch"
)
sha512sums=('SKIP'
            'SKIP'
            '57f597c0e2fa6db631b7745fb1162191d884b81f2ab90b1e5ef6194a5271c054d95705b531b9ad991efff25069bf5a3bd2110cc2db44b8852ed2efb94e822569')
b2sums=('SKIP'
        'SKIP'
        'e47c47f488f9c7f6047e491e3d4513e86dbbf917a8d31f7c06fd639e5d42e629bf8799c8c0aa8fd6db916d3bfcbf2537aa7159a501ffca2fdbda6e04e69c7575')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.libs/oddsound-mts/MTS-ESP.url "${srcdir}/MTS-ESP"
  git submodule deinit libs/JUCE
  git submodule deinit libs/pybind11
  git submodule deinit libs/tuning-library
  git submodule update

  patch -Np1 -i ../"${_name}-1.0.0.r117.gb9d6dc3-remove_vendoring.patch"
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
  'libogg.so' 'libusb-1.0.so' 'libvorbis.so' 'libvorbisenc.so'
  'libvorbisfile.so')

  cd "$pkgname"
  make DESTDIR="$pkgdir/" install -C build
}
