# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=aio-creator-neo
pkgver=3.1.1
pkgrel=1
pkgdesc='Design a custom app to control your smart home. Supports many vendors.'
arch=('x86_64')
url='https://www.mediola.com/en/products#aio-creator-neo'
license=('LicenseRef-eula')
depends=('dxvk' 'wine' 'wine-mono' 'wine-gecko')
makedepends=('innoextract')
options=('!strip')
install="${pkgname}.install"

# The vendor’s EULA is available online. To update it, run:
# curl -L 'https://www.mediola.com/eula' | html2text --body-width=80 | awk '/^###\s.*(EULA)/,/^####$/ { print }' | head -n -2 > eula.md

_pkgver_major_minor="$(cut -d . -f -2 <<< "${pkgver}")"
source=(
  "${pkgname}-${pkgver}-installer.exe::https://s3-eu-west-1.amazonaws.com/mediola-download/creator_neo/release/${_pkgver_major_minor}/${pkgver}/aioCreatorNeoInstaller.exe"
  "${pkgname}.bash"
  'eula.md'
)

sha512sums=(
  '3ae07262b08e26e63229ab9b870e18c0562f3e4506e67a65de3658418c4bd0bc59ebd8a0203a70d4f92a0c72671f5c020229e6366496022fda15a296ea9c7353'
  '308b84b654e63fe14cd68f6bb8fdeb1f0e7afe1b15127fa5779cbe40227c9a6616060b27e28e98505f72d26873379b6a3672fc98060f6e47e64667f81a91d500'
  '70910fb6b981c832416396474b8e0a551457cf64a433626eb80785e862aa999719151d022d538c66b9a5fa2c5ec7bd3506289a614c1c1f10cfabba022993ab77'
)

prepare() {
  innoextract -d "${srcdir}" "${pkgname}-${pkgver}-installer.exe"
}

package() {
  echo >&2 'Packaging credits.html'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/app/aio_creator_neo/credits.html"

  echo >&2 'Packaging license files'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'eula.md' \
    "${srcdir}/app/aio_creator_neo/licenses/files"/*

  echo >&2 'Packaging the executable'
  install -D -m 755 -T "${srcdir}/aio-creator-neo.bash" \
    "${pkgdir}/usr/bin/aio-creator-neo"

  echo >&2 'Packaging app files'
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r --preserve=mode "${srcdir}/app" "${srcdir}/commonappdata" \
    "${pkgdir}/opt/${pkgname}/"
}
