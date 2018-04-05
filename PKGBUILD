# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=giada
pkgname="${_pkgname}-vst"
pkgver=0.14.6
pkgrel=2
pkgdesc="A looper, drum machine, sequencer, live sampler and plugin host (VST enabled)"
arch=('i686' 'x86_64')
url="http://www.giadamusic.com/"
license=('GPL3')
groups=('pro-audio')
depends=('fltk' 'jansson' 'libpulse' 'libsamplerate' 'libxpm' 'rtmidi')
makedepends=('gendesk' 'icoutils' 'steinberg-vst36')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}-src.tar.gz::http://www.giadamusic.com/download/grab/source")
md5sums=('f5610aa6bf82b3749290b88746e1dec3')
changelog='ChangeLog'


prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}-src"

  autoreconf -vfi
  # XDG desktop file
  gendesk -f -n \
          --pkgname ${_pkgname} \
          --pkgdesc "${pkgdesc}" \
          --name Giada \
          --categories "Audio;MIDI;Music;Sequencer" \
          --startupnotify true
  # App icon
  icotool -x -i 1 -o ${_pkgname}.png src/ext/${_pkgname}.ico
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-src"

  ./configure --prefix=/usr --target=linux --enable-vst
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-src"

  make DESTDIR="${pkgdir}" install
  # Desktop integration
  install -Dm644 ${_pkgname}.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 ${_pkgname}.desktop -t "${pkgdir}/usr/share/applications"
  # docs
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
