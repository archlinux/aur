# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=drawio-textconv
pkgver=0.1.1
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
makedepends=('python-myst-parser' 'python-sphinx')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/drawio-textconv/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  'f7e80492f240933c36cadd452777f509010c5794cf6c8610d10cc0b9df51707337746b848419b5ddcc09b8a066427ecccec4a25bcf44e97e827b2e71246702e1'
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

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Generating man page'
  sphinx-build -aqEW -b man doc/sphinx build/man
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

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'

  echo >&2 'Packaging the man page'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man1" \
    build/man/*.1
}
