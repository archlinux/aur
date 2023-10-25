# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=znapzupport
pkgver=0.1.7
pkgrel=1
pkgdesc='Collection of CLI helpers for ZnapZend'
arch=('any')
url='https://github.com/claui/znapzupport'
license=('custom:ISC')
depends=('coreutils' 'procmail' 'sudo' 'zfs')
optdepends=('znapzend')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/znapzupport/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'a092458cefb548da288ef306b562df6c4f4ff2a0e3296800903c7f88b608f570a973e5d1b43116eafcc527ba82ba3958997d98636e8f74f5c42057b000eae088'
)

noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}"
  tar -x \
    -f "${srcdir}/${pkgname}-${pkgver}.tar.gz" -z \
    -C "${srcdir}/${pkgname}-${pkgver}" \
    --strip-components=1
}

build() {
  # Prepare binstub
  mkdir -p "${srcdir}"
  # shellcheck disable=SC2016
  printf '#!/bin/bash\nexec "/usr/lib/%s/bin/$(basename "${0}")" "$@"\n' \
    "${pkgname}" > "${srcdir}/binstub"
}

package() {
  echo >&2 'Installing the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE.md"

  echo >&2 'Installing package files'
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r --preserve=mode -t "${pkgdir}/usr/lib/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/"{bin,libexec}

  echo >&2 'Installing binstubs'
  export srcdir pkgdir
  find "${srcdir}/${pkgname}-${pkgver}/bin" \
    -mindepth 1 \
    -exec bash -c 'install -D -m 755 -T "${srcdir}"/binstub \
      "${pkgdir}"/usr/bin/$(basename "$1")' _ '{}' ';'

  echo >&2 'Installing documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/README.md"
}
