# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=giada-git
pkgver=v0.18.0.1.r0.g61c8d6ef
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=('x86_64')
url="https://www.giadamusic.com/"
license=('GPL3')
groups=('pro-audio')
depends=('gcc-libs' 'glibc' 'libx11' 'libxpm')
# upstream vendors a hacked rtaudio :(
makedepends=('alsa-lib' 'catch2' 'cmake' 'fltk' 'gendesk' 'git' 'imagemagick' 'jack'
'libpulse' 'libsamplerate' 'libsndfile' 'libxrandr' 'nlohmann-json' 'rtmidi' 'vst3sdk' 'steinberg-vst')
checkdepends=('xorg-server-xvfb')
provides=('vst3-host')
conflicts=('giada' 'giada-vst')
_last_good_commit=a935f95f41a75055cdae4133fa860e3234621294
bad=6559aa56ac95cc7760d399b5a624505c5f6a4df1

source=("giada-git::git+https://github.com/monocasual/giada.git"
        "$pkgname-devendor_nlohmann_json.patch"
        "JUCE-6.0.7.tar.gz::https://github.com/WeAreROLI/JUCE/archive/6.0.7.tar.gz"
      	"https://raw.githubusercontent.com/nlohmann/json/db78ac1d7716f56fc9f1b030b715f872f93964e4/single_include/nlohmann/json.hpp"
      	"git+https://github.com/monocasual/rtaudio.git"
      	"git+https://github.com/monocasual/geompp.git")
sha512sums=('SKIP'
            'b9d952c0816dd2b81dadff24521b19f305ca5ddeb1964dd81ce93e6f63b25dbf291c07e528cc2836f268a095bf9920786331a615230416f44a9014ff581a0bce'
            'fe17273de00e34012b08e8355a04796b5e04020afb53c1473e6d891d5307e66470c8c113029a0f3270f6a103a781a7ddf81dcf7684e1ce31eb2cae7bddae840f'
            'a3bdd5dc53097584bf2bbe19f296b1726b9fa751905bae22990dc9eb17015e49e1911956b1e29dbaacbe6c285100a653179c191f223b6e612be633505347c34c'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  cp -r ../JUCE-6.0.7/modules/ src/deps/juce/
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

  # devendor nlohmann-json
  patch -Np1 -i ../"$pkgname-devendor_nlohmann_json.patch"

  # rtaudio
  git config submodule.src/deps/rtaudio.url $srcdir/rtaudio
  git submodule update src/deps/rtaudio

  # geompp
  git config submodule.src/deps/geompp.url $srcdir/geompp
  git submodule update src/deps/geompp
}

build() {
  cd "$pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE='None' \
      -DWITH_VST2=on \
      -DWITH_VST3=ON \
      -DWITH_TESTS=ON \
      -W no-dev \
      -B build \
      -S .

  make VERBOSE=1 -C build
}

# # unclear how to run tests: https://github.com/monocasual/giada/issues/463
# check(){
#   cd "$pkgname-$pkgver"
#   make check VERBOSE=1 -C build
# }

package() {
  depends+=('libasound.so' 'libfltk.so' 'libfreetype.so' 'libjack.so'
  'libpulse.so' 'libpulse-simple.so' 'librtmidi.so' 'libsamplerate.so'
  'libsndfile.so')
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install -C build


  # Hack to allow (re)building package without --cleanbuild
  # This is because I'm copying files to those submodules instead of updating them
  git submodule deinit --all -f

  # XDG integration
  install -vDm 644 "${pkgname/-git}.desktop" -t "${pkgdir}/usr/share/applications"
  install -vDm 644 "extras/${pkgname/-git}-logo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname/-git}.svg"
  # docs
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
