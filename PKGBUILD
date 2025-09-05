# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=aio-remote-neo
pkgver=1.93.3
pkgrel=1
pkgdesc='Smart home app that hosts your custom remote control designs from AIO CREATOR NEO'
arch=('x86_64')
url='https://www.mediola.com/service#downloads?type=software&product=aioremote_desktop'
license=('LicenseRef-eula')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'libcups'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nodejs'
  'nspr'
  'nss'
  'pango'
)
options=('!debug')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://s3-eu-west-1.amazonaws.com/mediola-download/aioremote_neo/release/desktop/${pkgver}/AIO+REMOTE+NEO-linux.tar.gz"
  'aio-remote-neo.bash'
)

sha512sums=('ec93745844a48d43b0f746c6d13fe04ef276bfb1f2a961de6dbc3da5e6ca32cab144aa9746f1331f5fc074d2a1b6c4ff44fef92605d188ea8d0bcee747c7300d'
            '802c2e819ff1964cf37f9b0198261943c922f0e34dff4f077c481fdd7670a6e8f5061c7fcfd08e0de30ba60519ce2de33c2640c270c5adfcc7635a175bc0df32')

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
