# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-book-of-hours-perpetual-edition-dlc
pkgver=2023.8.g.2
pkgrel=1
pkgdesc='Perpetual Edition DLC for Book Of Hours. GOG version.'
_shortname="${pkgname#gog-}"

# Need to hard-code the ID because lgogdownloader doesn’t recognize
# the DLC by name
_gog_id='1228572957'

arch=('any')
url="https://www.gog.com/en/game/${_shortname//-/_}"
license=('custom')
makedepends=('lgogdownloader' 'unzip')
optdepends=('gnome-control-center: select GNOME background')
options=('!strip')

source=(
  "${_shortname}_latest.sh::gogdownloader://${_gog_id}/en3installer0"
  'book-of-hours-desktop-backgrounds.xml'
  'book-of-hours-mobile-backgrounds.xml'
)

sha512sums=(
  'SKIP'
  '31038ab84934759c4de56f335dde95714dffb7f4b876920eed67a4ec1f6d886eb3930587632121815d53b7ed1e98cfb1950ce20121b3bbc0b7c7169ae8bfa0a3'
  '532379308a82d7a66a87ac648c3bfa8985d24269c1231789808f83312313f770bfe8834707d8268122c90149a13d4ccb2cd82d2881f51d5de4f9d5cffabd0f55'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader -o %o')
PKGEXT=.pkg.tar

pkgver() {
  awk -F '"' -e '/ version =/ { print $2 }' "${srcdir}/scripts/config.lua"
}

prepare() {
  echo >&2 'Extracting wallpapers'
  unzip -d "${srcdir}/wallpapers" \
    "${srcdir}/data/noarch/game/BOOK OF HOURS Perpetual Edition wallpapers.zip"
}

package() {
  echo >&2 'Packaging wallpapers'
  install -D -m 644 -t "${pkgdir}/usr/share/backgrounds/book-of-hours-desktop/" \
    "${srcdir}/wallpapers"/*'desktop wallpaper'*
  install -D -m 644 -t "${pkgdir}/usr/share/backgrounds/book-of-hours-mobile/" \
    "${srcdir}/wallpapers"/*'mobile wallpaper'* \
    "${srcdir}/wallpapers/tarot desktop desktop (1280 x 1920).png" # sic

  echo >&2 'Packaging manifest for backgrounds in GNOME'
  install -D -m 644 -t "${pkgdir}/usr/share/gnome-background-properties/" \
    "${srcdir}/book-of-hours-desktop-backgrounds.xml" \
    "${srcdir}/book-of-hours-mobile-backgrounds.xml"

  echo >&2 'Packaging license'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/docs/BOOK OF HOURS: Perpetual Edition Content/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/End User License Agreement.txt"
}
