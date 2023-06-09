# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=aio-remote-neo
pkgver=1.87.2
pkgrel=1
pkgdesc='Smart home app that hosts your custom remote control designs from AIO CREATOR NEO'
arch=('x86_64')
url='https://shop.mediola.com/aio-creator-neo'
license=('custom')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'libcups'
  'libxcomposite'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nss'
  'pango'
)
conflicts=('aio-remote-neo-git')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://s3-eu-west-1.amazonaws.com/mediola-download/aioremote_neo/release/desktop/${pkgver}/AIO+REMOTE+NEO-linux.tar.gz"
  'aio-remote-neo.bash'
)

sha512sums=(
  '3e68640d0e9f4c77192b416ed612d7f39636570a2b4945db7d0c24646d7903d708c56296b5c475e444301fcc068f1a141f776bdbf531a36dbf86f72711b5cdb9'
  '802c2e819ff1964cf37f9b0198261943c922f0e34dff4f077c481fdd7670a6e8f5061c7fcfd08e0de30ba60519ce2de33c2640c270c5adfcc7635a175bc0df32'
)

prepare() {
  rm -f "${srcdir}/AIO REMOTE NEO/.DS_Store"
  chmod 755 "${srcdir}/AIO REMOTE NEO"{,/lib,/locales,/swiftshader}
}

package() {
  echo >&2 'Packaging the application'
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r --preserve=mode -T "${srcdir}/AIO REMOTE NEO" \
    "${pkgdir}/opt/${pkgname}"

  echo >&2 'Packaging the executable'
  install -D -m 755 -T "${srcdir}/aio-remote-neo.bash" \
    "${pkgdir}/usr/bin/aio-remote-neo"

  echo >&2 'Packaging README.txt, credits.html'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/README.txt" "${srcdir}/AIO REMOTE NEO/credits.html"

  echo >&2 'Packaging desktop file'
  install -D -m 644 -t "${pkgdir}/usr/share/applications/${pkgname}" \
    "${srcdir}/AIO REMOTE NEO.desktop"

  echo >&2 'Packaging license files'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/AIO REMOTE NEO/License_"{de,en}'.txt' \
    "${srcdir}/AIO REMOTE NEO/mediola/eula.html" \
    "${srcdir}/AIO REMOTE NEO/mediola/licenses/files"/*
}
