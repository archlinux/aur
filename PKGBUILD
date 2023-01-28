# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname='gog-enter-the-gungeon'
pkgver=2.1.9.33951
pkgrel=2
pkgdesc="Fast-paced bullet hell dungeon crawler with roguelike elements"
url='http://dodgeroll.com/gungeon/'
license=('custom')
arch=('x86_64' 'i686')
depends=('sdl2' 'zlib')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "enter_the_gungeon_${pkgver//./_}.sh::gogdownloader://enter_the_gungeon/en3installer0"
)
sha256sums=('e06bf3e648aea9a6cc72cb297e097ea86bcca84c50c7e18a5f1c3cc3e554705e'
            '3560f0a19fc43566001a153c60d776da4467e74d4d99f3c74eb52f3f1b76fa90'
            '23eb414b55da3eecabb1ed0773499b30effabe563d08a0f6e74a1999db48067c')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

prepare() {
  find . -type d -exec chmod 755 {} \;
}

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  mv \
    "${srcdir}/data/noarch/game" \
    -t "${pkgdir}/opt/${pkgname}/"

  if [[ "$CARCH" = "x86_64" ]]
    then
    rm -f "${pkgdir}/opt/${pkgname}/game/EtG.x86"
    rm -rf "${pkgdir}/opt/${pkgname}/game/EtG_Data/Mono/x86"
    rm -rf "${pkgdir}/opt/${pkgname}/game/EtG_Data/Plugins/x86"
  elif [[ "$CARCH" = "i686" ]]
    then
    rm -f "${pkgdir}/opt/${pkgname}/game/EtG.x86_64"
    rm -rf "${pkgdir}/opt/${pkgname}/game/EtG_Data/Mono/x86_64"
    rm -rf "${pkgdir}/opt/${pkgname}/game/EtG_Data/Plugins/x86_64"
  fi

  install -D -m 755 -T \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 755 \
    "${srcdir}/data/noarch/start.sh" \
    -t "${pkgdir}/opt/${pkgname}/"
  install -D -m 755 \
    "${srcdir}"/data/noarch/support/*.{sh,shlib} \
    -t "${pkgdir}/opt/${pkgname}/support/"
  install -D -m 644 \
    "${srcdir}/data/noarch/gameinfo" \
    -t "${pkgdir}/opt/${pkgname}/"

  install -D -m 644 -T \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 644 -T \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m 644 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

