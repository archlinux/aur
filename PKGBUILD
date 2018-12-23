# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=giada
pkgname="${_pkgname}-vst"
pkgver=0.15.3
pkgrel=1
pkgdesc="A looper, drum machine, sequencer, live sampler and plugin host (VST enabled)"
arch=('i686' 'x86_64')
url="http://www.giadamusic.com/"
license=('GPL3')
groups=('pro-audio')
depends=('fltk' 'jansson' 'libpulse' 'libsamplerate' 'libxpm' 'rtmidi')
makedepends=('gendesk' 'icoutils' 'steinberg-vst36')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("http://www.giadamusic.com/data/${_pkgname}-${pkgver}-src.tar.gz")
md5sums=('ae9e13fe9926261946bfd5c5f34329a9')
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
