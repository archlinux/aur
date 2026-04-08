# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=aio-remote-neo
pkgver=1.95.0
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
  'glib2'
  'glibc'
  'libatomic'
  'libcups'
  'libdrm'
  'libgcc'
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

sha512sums=('c242be8bd903dc3e190a0038fc91589437df126b7b852d7c99b32bfd8d35315fbb6885106114dcf07afc33e089c22c7ee9edbede54bb36f45d04ae760503f6e0'
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
