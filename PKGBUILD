# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=aio-creator-neo
pkgver=3.0.3
pkgrel=1
pkgdesc='Design a custom app to control your smart home. Supports many vendors.'
arch=('x86_64')
url='https://www.mediola.com/en/products#aio-creator-neo'
license=('custom')
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
  '834e578d4834b0bc6f917eedf79f73080f6f4e25cab0d823efc510d98ed67c501fc1a95f5f24044cfe7e4e76603ec5cc8326fad0801b3f796988bacae0c9ff30'
  '308b84b654e63fe14cd68f6bb8fdeb1f0e7afe1b15127fa5779cbe40227c9a6616060b27e28e98505f72d26873379b6a3672fc98060f6e47e64667f81a91d500'
  'c7ecb4026b2145bd7675a9b4aaa01d53b3d14930302e36682a50efabebff7a7af9d6279e103220092fdd5706506b46e10cc56acd3397cfb0b211377825f8b727'
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
