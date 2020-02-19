# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=giada-git
pkgver=v0.16.2.r0.ga042f4a1
pkgrel=1
pkgdesc="A free, minimal, hardcore audio tool for DJs, live performers and electronic musicians"
arch=('x86_64')
url="https://www.giadamusic.com/"
license=('GPL3')
groups=('pro-audio')
depends=('fltk' 'jansson' 'libpulse' 'libxpm' 'rtmidi')
makedepends=('gendesk' 'imagemagick')
checkdepends=('catch2')
conflicts=('giada' 'giada-vst')
source=("giada-git::git+https://github.com/monocasual/giada.git"
	"git+https://github.com/monocasual/rtaudio.git"
         "JUCE-5.3.2.tar.gz::https://github.com/WeAreROLI/JUCE/archive/5.3.2.tar.gz"
	 "https://raw.githubusercontent.com/nlohmann/json/bde57124187c5732c026ffb9357c0491344c45e7/single_include/nlohmann/json.hpp"
	 "gcc9-fix.diff"
	)
sha512sums=('SKIP'
            'SKIP'
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

  mkdir -p src/deps/json/single_include/nlohmann/ && cp ../json.hpp src/deps/json/single_include/nlohmann/

  autoreconf -vfi
  # XDG desktop file
  gendesk -n -f \
          --pkgname ${pkgname} \
          --pkgdesc "${pkgdesc}" \
          --name Giada \
          --categories "AudioVideo;Audio;Midi;Sequencer"
  convert +set date:create +set date:modify \
    "src/ext/${pkgname/-git}.ico" \
    "${pkgname}.png"
 # fixing catch2 include for system library
  sed -e 's|catch\.hpp|catch2/catch\.hpp|g' -i tests/*.cpp

  git submodule init src/deps/rtaudio
  git config submodule.src/deps/rtaudio.url  $srcdir/rtaudio
  git submodule update

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
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
  # XDG integration
  install -vDm 644 "${pkgname/-git}.desktop" -t "${pkgdir}/usr/share/applications"
  install -vDm 644 "${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
  # docs
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
