# Maintainer: Selene Bray-Hernandez <selebray1998 (at) gmail (dot) com>
# Contributor: based on canon-pixma-mg3000-complete PKGBUILD by Peter Nagy

pkgname=canon-pixma-tr160-complete
pkgver=6.81
pkgrel=2
pkgdesc='Canon PIXMA TR160 printer driver (print-only, no scanner)'
arch=(x86_64)
url='https://www.usa.canon.com/support/p/pixma-tr160'
license=(custom)
depends=(popt libpng12 libusb-compat libtiff libxml2-legacy gtk2)
makedepends=(deb2targz)
conflicts=(cnijfilter2)

_sourceDeb="cnijfilter2-${pkgver}-1-deb"
_debName="cnijfilter2_${pkgver}-1_amd64"
_ppd='canontr160.ppd'

source=("https://gdlp01.c-wss.com/gds/2/0100012532/01/${_sourceDeb}.tar.gz")
sha256sums=('SKIP')

pkgver() {
  local ver
  ver=$(curl -sL "https://asia.canon/en/support/0101253201" \
    | grep -oP 'cnijfilter2-\K[0-9]+\.[0-9]+(?=-1-deb)' \
    | head -1)
  echo "${ver:-${pkgver}}"
}

build() {
  cd "${srcdir}"
  tar xzf "${_sourceDeb}.tar.gz"
}

package() {
  cd "${pkgdir}"

  cp "${srcdir}/${_sourceDeb}/packages/${_debName}.deb" .
  deb2targz "${_debName}.deb"
  rm -f "${_debName}.deb"

  tar xJf "${_debName}.tar.xz"
  rm -f "${_debName}.tar.xz"

  install -vDm 644 "usr/share/ppd/${_ppd}" "usr/share/cups/model/${_ppd}"
  rm -rf usr/share/ppd

  find usr/share/doc/ -name 'LICENSE*' -execdir install -vDm 644 {} "${pkgdir}/usr/share/licenses/${pkgname}/{}" \;
}
