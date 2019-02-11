# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=giada-git
pkgver=v0.15.3.r62.gd4068c49
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
source=("giada-git::git+https://github.com/monocasual/giada.git#branch=record-signal"
         "git+https://github.com/WeAreROLI/JUCE.git")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  
  git submodule init src/deps/juce
  git config submodule.src/deps/juce.url $srcdir/JUCE
  git submodule update src/deps/juce


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
  ./configure --prefix=/usr --target=linux --enable-vst --enable-system-catch

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
