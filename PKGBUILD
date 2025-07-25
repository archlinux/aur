# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=aio-creator-neo
pkgver=3.3.0
pkgrel=1
pkgdesc='Design a custom app to control your smart home. Supports many vendors.'
arch=('x86_64')
url='https://www.mediola.com/en/products#aio-creator-neo'
license=('LicenseRef-eula')
depends=(
  'bash'
  'coreutils'
  'dxvk'
  'lib32-gnutls'
  'lib32-libxcomposite'
  'wine'
  'wine-mono'
  'wine-gecko'
  'winetricks'
  'zenity'
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

sha512sums=('4465187fea388e81b13cd1347eb29485138b2d80379a2b589c6770282e43c4503ff874047fb710d026ec20dedd6b0a460dd976ba1d07e066e0d2b11e6cb70b67'
            '9193c75fc94b5ed357eb7be603760a9bd881aac1f00270573a431d756935308317290dd5b34bd4f0c22cf0959b7a10cdeec14bfcb253d9a9a13aa3b6ae13b303'
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
