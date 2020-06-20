# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=giada-git
pkgver=v0.16.3.r10.g3dc97d07
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=('x86_64')
url="https://www.giadamusic.com/"
license=('GPL3')
groups=('pro-audio')
depends=('fltk' 'gcc-libs' 'glibc' 'libx11' 'libxpm')
makedepends=('alsa-lib' 'gendesk' 'imagemagick' 'jack' 'libpulse' 'libsamplerate' 'libsndfile' 'nlohmann-json' 'rtmidi')
checkdepends=('catch2' 'xorg-server-xvfb')
conflicts=('giada' 'giada-vst')
source=("giada-git::git+https://github.com/monocasual/giada.git"
        "$pkgname-devendor_nlohmann-json.patch"
         "JUCE-5.3.2.tar.gz::https://github.com/WeAreROLI/JUCE/archive/5.3.2.tar.gz"
	 "https://raw.githubusercontent.com/nlohmann/json/bde57124187c5732c026ffb9357c0491344c45e7/single_include/nlohmann/json.hpp"
	 "gcc9-fix.diff"
	)
sha512sums=('SKIP'
            '31cf5b2b1bba29e8c97109c04c6456a98b778017ef5d48a0f020d326d8a11a5e76c8613fc232a2492d16aa48bc2faaae4aae7316252d6b887bd2187032fb83f9'
            'f968a622306e12542c0971fd4cac5c311d70304d63fef8a177e8624a3f43916254122cf5d068974bf062a59d95fd6df97400a3d2ff950b117399cc667b976b9d'
            'a3bdd5dc53097584bf2bbe19f296b1726b9fa751905bae22990dc9eb17015e49e1911956b1e29dbaacbe6c285100a653179c191f223b6e612be633505347c34c'
            '0b011913f031930d3540daf2bec8df66b345f59c79d1666a6447f5b1be0b0e59cfd855bd6ec581118cd6949f24aba8e4c503ad73f0fe5a4bb1882b60ed3cd41f')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  cp -r ../JUCE-5.3.2/modules/ src/deps/juce/
  patch -p2 -i ../../../../../gcc9-fix.diff -d src/deps/juce/modules/

  autoreconf -vfi
  # XDG desktop file
  gendesk -n -f \
          --pkgname ${pkgname/-git} \
          --pkgdesc "${pkgdesc}" \
          --name Giada \
          --categories "AudioVideo;Audio;Midi;Sequencer"

  # fixing catch2 include for system library
  sed -e 's|catch\.hpp|catch2/catch\.hpp|g' -i tests/*.cpp
  # devendor nlohmann-json
  patch -Np1 -i ../"$pkgname-devendor_nlohmann-json.patch"
}

build() {
  cd "$pkgname"

  ./configure --prefix=/usr \
              --target=linux \
              --enable-vst \
              --enable-system-catch

  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  depends+=('libasound.so' 'libjack.so' 'libpulse.so' 'libpulse-simple.so' 'librtmidi.so' 'libsamplerate.so' 'libsndfile.so')
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
  # XDG integration
  install -vDm 644 "${pkgname/-git}.desktop" -t "${pkgdir}/usr/share/applications"
  install -vDm 644 "extras/${pkgname/-git}-logo.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname/-git}.png"
  # docs
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
