# Contributor: Sebastian Wolf <fatmike303@gmail.com>
pkgname=advancemame
pkgver=3.5
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
  '779b3b43e3fbdf4bb24e97c418499cd4550446494e19f5d576827242b0821814'
  '42c33684c5c6e44269c7102dc404652721e4802bb19a495c264127bfee52a9d0'
  '6633a06a972f69142af5c3ee538b80e0705ef79eed9f5f4097811015be1cfb41'
)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  if [ "$CARCH" == 'armv7h' ]; then # Do not link SDL into Raspberry Pi build
    ./configure CFLAGS="-O2 -fno-strict-aliasing -fno-strict-overflow -fsigned-char" --prefix=/usr --disable-sdl --disable-sdl2
  else
    ./configure CFLAGS="-O2 -fno-strict-aliasing -fno-strict-overflow -fsigned-char" --prefix=/usr
  fi
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Install built files
  make bindir="${pkgdir}/usr/bin/" \
       datadir="${pkgdir}/usr/share/" \
       mandir="${pkgdir}/usr/share/man/" \
       pkgdocdir="${pkgdir}/usr/share/doc/${pkgname}/" \
       install

  # Install menu entry
  cd ..
  convert favicon.ico ${pkgname}.png
  install -Dm644 ${pkgname}.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
}

