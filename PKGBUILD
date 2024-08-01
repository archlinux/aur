# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=aio-creator-neo
pkgver=3.2.0
pkgrel=2
pkgdesc='Design a custom app to control your smart home. Supports many vendors.'
arch=('x86_64')
url='https://www.mediola.com/en/products#aio-creator-neo'
license=('LicenseRef-eula')
depends=(
  'bash'
  'dxvk'
  'lib32-gnutls'
  'lib32-libxcomposite'
  'wine'
  'wine-mono'
  'wine-gecko'
)
makedepends=('innoextract')
options=('!debug' '!strip')
install="${pkgname}.install"

# The vendor’s EULA is available online. To update it, run:
# curl -L 'https://www.mediola.com/eula' | html2text --body-width=80 | awk '/^###\s.*(EULA)/,/^####$/ { print }' | head -n -2 > eula.md

_pkgver_major_minor="$(cut -d . -f -2 <<< "${pkgver}")"
source=(
  "${pkgname}-${pkgver}-installer.exe::https://s3-eu-west-1.amazonaws.com/mediola-download/creator_neo/release/${_pkgver_major_minor}/${pkgver}/aioCreatorNeoInstaller.exe"
  "${pkgname}.bash"
  'eula.md'
)

sha512sums=('550bc90f7d0f2de3f3101feac861ad4b5c43c5d88945eb53dd578b29fb47d5c7ec7d85d19efeb4fcc1f7278d20addb5a4eaeb095543536126fb440cd44c1f695'
            '308b84b654e63fe14cd68f6bb8fdeb1f0e7afe1b15127fa5779cbe40227c9a6616060b27e28e98505f72d26873379b6a3672fc98060f6e47e64667f81a91d500'
            'c9110733aa9269fba458cb06b676f425455d4d1f0181b69e1a26345216802ae1ca2010915f75d3692dbb1ef5df9ac92986c3ee34322d9b9c96acf6e618c6ba5f')

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
