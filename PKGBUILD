# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=aio-creator-neo
pkgver=2.11.4
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
  '85f22d42fa470698fbea38e0a34cf7077fb394b331516405073606dd8b4a2cf7564f1cbbb464dcbc90912cb296f833283b8a906bc0d9eee2fbd163eb5d65551d'
  'bc47d7d69f96f1f1108291d95e438a169890964a4d8fefbfa67752609f66e77d3926b2879fe820f9956b71be64a8f02afd3a6302174526ca32d37bb8481cf0e2'
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
