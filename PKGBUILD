# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bespokesynth
pkgname=bespokesynth-git
pkgver=1.1.0.r12.g7d802f2
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
  "${_name}-1.1.0.r12.g7d802f2-devendor_tuning_library.patch::https://github.com/dvzrv/BespokeSynth/commit/4a42c0945ff7f4cebac58482be5217a16122eca4.patch"
  "${_name}-1.1.0.r12.g7d802f2-devendor_juce.patch::https://github.com/dvzrv/BespokeSynth/commit/04efc00b1f97b9ea3e1ec1bc3666baf23c1c693c.patch"
)
sha512sums=('SKIP'
            'SKIP'
            '1a2f8c2397f52572b9ae3680e6b7fb092d568cdba5d6ba13a54e7e7bdd160491bca5bc53b43d461ae1fc3bdd11f5ecebd336a20285a7cd4e869c150f752900ca'
            'be7fa56c1b46b1d3d157e88ea84fdea70be8e5287a19b2c75b20f0d580a4e3078ad7e02939734cf11be8ff75a69c3f8a29aaa88df91e5c45530eac9e360f6712')
b2sums=('SKIP'
        'SKIP'
        'f40b598e2dd3bc12cc6117748147608da3cae7895cda8e7822c3d3e9d1b805ffd702dce3848ffe3ce55660e1789515c7cb903e226e9592c45bed2442e51b185c'
        '9d6b2f09822f542c8873b73942f1a1decb21b7e3fe81687c058795dd8e76ac4d55b99e2a4bdbb314eca2b788958fb5a9908e8482b4555f52037a4e31fa000562')
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

  patch -Np1 -i ../${_name}-1.1.0.r12.g7d802f2-devendor_tuning_library.patch
  patch -Np1 -f -i ../${_name}-1.1.0.r12.g7d802f2-devendor_juce.patch
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
