# Contributor: Sebastian Wolf <fatmike303@gmail.com>
pkgname=advancemame
pkgver=5.0
pkgrel=1
pkgdesc="Unofficial MAME/MESS version with an advanced video support for use with TVs, Arcade monitors, PC monitors and LCD screens. Also includes AdvanceMENU frontend."
arch=('i686' 'x86_64' 'armv7h')
url="http://www.advancemame.it"
depends=('alsa-lib' 'freetype2' 'slang')
depends_i686=('sdl2')
depends_x86_64=('sdl2')
makedepends=('imagemagick')
conflicts=('advancemenu' 'advancemess')
provides=('advancemenu' 'advancemess')
license=('GPL')
source=(
  "https://github.com/amadvance/advancemame/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "http://www.advancemame.it/favicon.ico"
  "${pkgname}.desktop"
)
sha256sums=(
  'a4fbc40e4e4d2e72383e139632bcd3e6ecfdc607fb8501002668bcf40c66bde9'
  '350dc1c4efa8d75a379d5f22bae918af419e12ec0cc9d7a3a73153fdf9ed82f5'
  '6633a06a972f69142af5c3ee538b80e0705ef79eed9f5f4097811015be1cfb41'
)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Do not link SDL into Raspberry Pi build
  if [ "$CARCH" == 'armv7h' ]; then
    ./configure CFLAGS="-O2 -fno-strict-aliasing -fno-strict-overflow -fsigned-char -fno-stack-protector" --prefix=/usr --disable-sdl --disable-sdl2
  else
    ./configure CFLAGS="-O2 -fno-strict-aliasing -fno-strict-overflow -fsigned-char -fno-stack-protector" --prefix=/usr
  fi
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Install files
  make bindir="${pkgdir}/usr/bin/" \
       datadir="${pkgdir}/usr/share/" \
       mandir="${pkgdir}/usr/share/man/" \
       pkgdocdir="${pkgdir}/usr/share/doc/${pkgname}/" \
       install

  # Install menu entry
  cd ..
  magick favicon.ico[2] ${pkgname}.png
  install -Dm644 ${pkgname}.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
}

