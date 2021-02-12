# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=giada-git
pkgver=v0.17.1.r2.g2b95a81b
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=('x86_64')
url="https://www.giadamusic.com/"
license=('GPL3')
groups=('pro-audio')
depends=('gcc-libs' 'glibc' 'libx11' 'libxpm')
# upstream vendors a hacked rtaudio :(
makedepends=('alsa-lib' 'cmake' 'fltk' 'gendesk' 'git' 'imagemagick' 'jack'
'libpulse' 'libsamplerate' 'libsndfile' 'libxrandr' 'nlohmann-json' 'rtmidi' 'vst3sdk' 'steinberg-vst')
checkdepends=('catch2' 'xorg-server-xvfb')
conflicts=('giada' 'giada-vst')
source=("giada-git::git+https://github.com/monocasual/giada.git"
	"$pkgname-rtmidi_cppflags.patch"
        "$pkgname-devendor_nlohmann_json.patch"
        "JUCE-6.0.4.tar.gz::https://github.com/WeAreROLI/JUCE/archive/6.0.4.tar.gz"
      	"https://raw.githubusercontent.com/nlohmann/json/db78ac1d7716f56fc9f1b030b715f872f93964e4/single_include/nlohmann/json.hpp"
      	"git+https://github.com/monocasual/rtaudio.git")
sha512sums=('SKIP'
            'ae222bb63b0388ef1b02ff2cda0e589545c80fae26cbf06c04e0963a661e32b4d6746eea424359a44bb20e7568dbb5335359c5226c36d9c8b86d10130e83fedc'
            '5b4b6c6c421851f4da72b6fb4ff457156d3332c5c7a795edffe05386d48864830e7b3afb4011996a8cd5284d2fdbc2e0da3d590108e04d00227d25bc3127f506'
            '94bfb122bad5f47be018f66b118a024eb56d537aecaedc440fd1648cbecb08375a2c375e6b1e12b39621bf8c272356fab98872b6a8cab506706cdc18f215096c'
            'a3bdd5dc53097584bf2bbe19f296b1726b9fa751905bae22990dc9eb17015e49e1911956b1e29dbaacbe6c285100a653179c191f223b6e612be633505347c34c'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  cp -r ../JUCE-6.0.4/modules/ src/deps/juce/
  #vst3 support headers
  cp -r /usr/include/vst3sdk/* src/deps/vst3sdk/
  #vst2 support headers
  cp -r /usr/include/vst36/pluginterfaces/vst2.x/ src/deps/vst3sdk/pluginterfaces/

  # XDG desktop file
  gendesk -n -f \
          --pkgname ${pkgname/-git} \
          --pkgdesc "${pkgdesc}" \
          --name Giada \
          --categories "AudioVideo;Audio;Midi;Sequencer"

  # remove targets for missing files:
  # https://github.com/monocasual/giada/issues/431
  sed -e '/baseButton/d' -i Makefile.am

  # add rtmidi cppflags:
  # https://github.com/monocasual/giada/issues/417
  patch -Np1 -i ../"$pkgname-rtmidi_cppflags.patch"

  # devendor nlohmann-json
  patch -Np1 -i ../"$pkgname-devendor_nlohmann_json.patch"
  
  # rtaudio
  git config submodule.src/deps/rtaudio.url $srcdir/rtaudio
  git submodule update src/deps/rtaudio
}

build() {
  cd "$pkgname"

  cmake -B build  \
	-DWITH_VST2=on \
	-DWITH_VST3=on \
	-DWITH_TESTS=on \
	-DWITH_SYSTEM_CATCH=on \
  -DCMAKE_BUILD_TYPE='None' \
  -Wno-dev

  make -C build

  # Hack to allow (re)building package without --cleanbuild
  # This is because I'm copying files to those submodules instead of updating them
  git submodule deinit --all -f
}

check(){
  cd "$pkgname"
  # move binary to expected directory:
  # https://github.com/monocasual/giada/issues/432
  mkdir -vp build
  cp -av "${pkgname}" build/
  xvfb-run -a make -k check
}

package() {
  depends+=('libasound.so' 'libfltk.so' 'libjack.so' 'libpulse.so'
  'libpulse-simple.so' 'librtmidi.so' 'libsamplerate.so' 'libsndfile.so')
  cd "$pkgname"
  install -vD "build/${pkgname/-git}" -t "${pkgdir}/usr/bin/"
  # XDG integration
  install -vDm 644 "${pkgname/-git}.desktop" -t "${pkgdir}/usr/share/applications"
  install -vDm 644 "extras/${pkgname/-git}-logo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname/-git}.svg"
  # docs
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
