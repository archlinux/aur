# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>

_appname_=zoiper
pkgname=${_appname_}-classic
pkgver=3.3
_filever_=3.3
pkgrel=2
pkgdesc="An IAX and SIP VoIP softphone (classic version)"
arch=("x86_64")
url="http://www.zoiper.com/"
license=("custom")
makedepends=('bitrock-unpacker')
depends=("gtk2" "alsa-lib" "libxdamage")

source=("LICENSE"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "Zoiper_${_filever_}_Linux_Free_32Bit_64Bit.tar.gz"::https://web.archive.org/web/20220818061911if_/https://www.zoiper.com/en/voip-softphone/download/zoiper3/for/linux
      )

prepare() {
  cd "${srcdir}"
  archive="Zoiper_${_filever_}_Linux_Free_32Bit_64Bit.tar.gz"

  tar -zxf "${archive}"

  # Unpack files from installer
  bitrock-unpacker Zoiper_3.3_Linux_Free_64Bit.run .
}

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/pixmaps"

  # Directories
  install -d "${pkgdir}/usr/bin" "${pkgdir}"/usr/share/zoiper-classic "${pkgdir}"/usr/share/pixmaps "${pkgdir}"/usr/share/licenses/${pkgname}

  # Files
  install Core_Files/etczoipercommunicatorx64/* "${pkgdir}/usr/share/zoiper-classic"
  install Core_Files/png_images_pixmaps/* "${pkgdir}/usr/share/pixmaps"
  install -Dm644 Core_Files/zoiper_desktop_conf/* "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -m644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop

  # Fix icon names
  mv "${pkgdir}/usr/share/pixmaps/zoiper.png" "${pkgdir}/usr/share/pixmaps/zoiper-classic.png"
  find "${pkgdir}/usr/share/pixmaps" -type f | while read -r i
  do
    newname=$(echo "$i" | sed 's/\(zoiper-\)\([0-9][0-9]*\.png\)$/\1classic-\2/')
    if [ ! -f "${newname}" ]
    then
      mv "$i" "${newname}"
    fi
  done

  # Fix permissions and create symlink
  chmod 755 "${pkgdir}/usr/share/zoiper-classic/zoiper"
  ln -s /usr/share/zoiper-classic/zoiper $pkgdir/usr/bin/zoiper-classic
}

sha1sums=('74e9f2d5dc6ec7174923e824b3db64b47b6d3b3c'
          '7458a11bac24aa7ecc454f374b43e5c3cb83faff'
          '1b68b4fc56baff2de6661b654053ce6b60fe174f'
          'ecd378c3ad135c67b797d20e7e7356ae9c01812b')
