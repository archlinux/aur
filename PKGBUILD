# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=znapzupport
pkgver=0.1.7
pkgrel=2
pkgdesc='Collection of CLI helpers for ZnapZend'
arch=('any')
url='https://github.com/claui/znapzupport'
license=('ISC')
depends=('coreutils' 'procmail' 'sudo' 'zfs')
optdepends=('znapzend')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/znapzupport/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'a092458cefb548da288ef306b562df6c4f4ff2a0e3296800903c7f88b608f570a973e5d1b43116eafcc527ba82ba3958997d98636e8f74f5c42057b000eae088'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Removing unneeded files'
  for dir in 'bin' 'libexec'; do
    find "${dir?}" -name '.*' -exec rm -fv '{}' +
  done

  echo >&2 'Preparing the binstub'
  # shellcheck disable=SC2016  # This isn’t supposed to expand at build time
  printf > 'binstub' \
    '#!/bin/bash\nexec "/usr/lib/%s/bin/$(basename "${0}")" "$@"\n' \
    "${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE.md'

  echo >&2 'Packaging library files and internal binstubs'
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r --preserve=mode -t "${pkgdir}/usr/lib/${pkgname}" \
    'bin' 'libexec'

  echo >&2 'Packaging external binstubs'
  find 'bin' -mindepth 1 -exec bash -c \
    'install -D -m 755 -T "${1}" "${2}/$(basename "${3}")"' \
    _ 'binstub' "${pkgdir}/usr/bin" '{}' ';'

  echo >&2 'Packaging documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'
}
