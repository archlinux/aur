# Tom < reztho at archlinux dot org >
# Based on the munt-git package from Franco Tortoriello

pkgname=munt
pkgdesc='Software synthesizer emulating pre-GM MIDI devices such as the Roland MT-32, CM-32L, CM-64 and LAPC-I'
pkgver=2.5.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://munt.sourceforge.net'
license=('GPL2')
depends=('qt5-multimedia' 'portaudio' 'hicolor-icon-theme')
makedepends=('cmake' 'imagemagick' 'gendesk')
options=('staticlibs')
__mt32suffix=libmt32emu
source=("https://github.com/${pkgname}/${pkgname}/archive/${__mt32suffix}_${pkgver//./_}.zip")
install=${pkgname}.install
sha512sums=('a6ae2b45c8bd0d222ae2afbecbff7e29291f1d92dcbe188e5cf915324af7111700d293522a6514e8c7801557702225d2fa456997eb77a66534ad4e8e8b88c8fd')

build() {
  cd "${srcdir}"
  gendesk -n -f \
          --pkgname="${pkgname}" \
          --pkgdesc="${pkgdesc}" \
          --name="Munt" \
          --categories="Audio;AudioVideo;Midi;X-Alsa;X-Jack;Qt" \
          --exec="/usr/bin/mt32emu-qt" \
          --startupnotify=true
  
  convert "${srcdir}/${pkgname}-${__mt32suffix}_${pkgver//./_}/mt32emu_qt/src/images/Icon.gif" -resize 32x32 "${srcdir}/munt.png"

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
