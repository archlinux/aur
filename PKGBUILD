# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=giada-git
pkgver=v0.15.4.r2.g251c67c3
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
         "JUCE-5.2.3.tar.gz::https://github.com/WeAreROLI/JUCE/archive/5.3.2.tar.gz"
          gcc9-fix.diff)
sha512sums=('SKIP'
            'f968a622306e12542c0971fd4cac5c311d70304d63fef8a177e8624a3f43916254122cf5d068974bf062a59d95fd6df97400a3d2ff950b117399cc667b976b9d'
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
          --pkgname ${pkgname} \
          --pkgdesc "${pkgdesc}" \
          --name Giada \
          --categories "AudioVideo;Audio;Midi;Sequencer"
  convert +set date:create +set date:modify \
    "src/ext/${pkgname/-git}.ico" \
    "${pkgname}.png"
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr --target=linux --enable-vst

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
