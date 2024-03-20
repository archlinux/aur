# Maintainer: Claudia Pellegrino <clau@tiqua.de>

pkgname=submagic
pkgver=0.1.1
pkgrel=1
pkgdesc='Writes stdin into a temp file and then prints the file name'
arch=('any')
url='https://github.com/claui/submagic'
license=('Apache-2.0')
depends=('bash')
makedepends=('python-myst-parser' 'python-sphinx')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/submagic/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '53b3c1a09ec173420d79534a3c361e1cfcabcc5520646ed911515494c02c393cb78852a606135424083c4c08cf74624add9ca875350a796d64453c4de0cbfbb1'
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
    'bin' 'libexec'

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
