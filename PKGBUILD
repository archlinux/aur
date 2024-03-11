# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=drawio-textconv
pkgver=0.1.0
pkgrel=1
pkgdesc='Git textconv helper to extract draw.io diagram sources (mxfiles) from .drawio.svg files'
arch=('any')
url='https://github.com/claui/drawio-textconv'
license=('Apache-2.0')
depends=(
  'bash'
  'coreutils'
  'libxml2'
  'libxslt'
  'ruby'
)
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/drawio-textconv/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'a8ce1f4e4eebc4d43e5a2a4b348b4da976cfcf9b15149c645ad048c41c465156c626615bfb51a6542720a6151d2c8623ff3ecd956f44c70e1a594035bf286d25'
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
    'LICENSE'

  echo >&2 'Packaging library files and internal binstubs'
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r --preserve=mode -t "${pkgdir}/usr/lib/${pkgname}" \
    'bin' 'libexec' 'share'

  echo >&2 'Packaging external binstubs'
  find 'bin' -mindepth 1 -exec bash -c \
      'install -D -m 755 -T "${1}" "${2}/$(basename "${3}")"' \
      _ 'binstub' "${pkgdir}/usr/bin" '{}' ';'

  echo >&2 'Packaging documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'
}
