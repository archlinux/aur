# Tom < reztho at archlinux dot org >
# Based on the munt-git package from Franco Tortoriello

pkgname=munt
pkgdesc='Software synthesizer emulating pre-GM MIDI devices such as the Roland MT-32, CM-32L, CM-64 and LAPC-I'
pkgver=2.0.1
pkgrel=1
arch=('i686' 'x86_64')
url='http://munt.sourceforge.net'
license=('GPL2')
depends=('qt4' 'portaudio' 'libpulse' 'alsa-lib')
makedepends=('cmake' 'imagemagick' 'gendesk')
options=('staticlibs')
__mt32suffix=libmt32emu
source=("https://github.com/${pkgname}/${pkgname}/archive/${__mt32suffix}_${pkgver//./_}.zip")
install=${pkgname}.install

build() {
  cd "${srcdir}"
  gendesk -n -f \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesc}" \
          --name="Munt" \
          --categories="Audio;AudioVideo;Midi;X-Alsa;X-Jack;Qt" \
          --exec="/usr/bin/mt32emu-qt" \
          --startupnotify=true
  
  convert "${srcdir}/${pkgname}-${__mt32suffix}_${pkgver//./_}/mt32emu_qt/src/images/note.gif" "${srcdir}/munt.png"

  cd "${srcdir}/${pkgname}-${__mt32suffix}_${pkgver//./_}"
  cmake -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "${srcdir}/${pkgname}-${__mt32suffix}_${pkgver//./_}"
  make DESTDIR="${pkgdir}" install
  
  install -Dm644 "${srcdir}/munt.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/munt.png"
  install -Dm644 "${srcdir}/munt.desktop" "${pkgdir}/usr/share/applications/munt.desktop"
}

md5sums=('c0ea9aa208967f7c8695015f7772ab0c')
