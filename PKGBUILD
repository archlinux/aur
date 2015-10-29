# Mantainer: Franco Tortoriello

pkgname=munt-git
_pkgname=munt
pkgdesc="Software synthesiser emulating pre-GM MIDI devices, such as the Roland MT-32"
pkgver=1629.b470b33
pkgrel=1
arch=(i686 x86_64)
url="http://munt.sourceforge.net"
license=(LGPL2.1)
depends=('qt4' 'portaudio' 'libpulse' 'alsa-lib')
makedepends=('git' 'cmake' 'imagemagick' 'gendesk')
options=(staticlibs)
source=(git://github.com/munt/munt.git)
provides=('munt')
conflicts=('munt')
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}"
  gendesk -n -f \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesc}" \
          --name="Munt" \
          --categories="Audio;AudioVideo;Midi;X-Alsa;X-Jack;Qt" \
          --exec="/usr/bin/mt32emu-qt" \
          --startupnotify=true
  
  convert "${srcdir}/${_pkgname}/mt32emu_qt/src/images/note.gif" "${srcdir}/munt.png"

  cd "${srcdir}/${_pkgname}"
  cmake -DWITH_INTERNAL_PORTAUDIO='FALSE' -DCMAKE_INSTALL_PREFIX='/usr'
  make -j24
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

