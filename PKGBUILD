# Maintainer: Claudia Pellegrino <clau@tiqua.de>

# namcap -e pkgnameindesc PKGBUILD

pkgname=compose
pkgver=0.1.0
pkgrel=1
pkgdesc='Search for a Unicode codepoint to scaffold a line for your Compose file'
arch=('any')
url='https://github.com/claui/compose'
license=('Apache-2.0')
depends=('bash' 'jq' 'uni')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/compose/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '8a02c3bc3681b8f354e2fa19b62a8fdab16b793a612d2a9c3582c33de8a4ccd448f943ed97a864e1be09bb3e7f46f84f3d95086c447aa8b4e6886025496dc97b'
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
    'bin' 'libexec'

  echo >&2 'Packaging external binstubs'
  find 'bin' -mindepth 1 -exec bash -c \
      'install -D -m 755 -T "${1}" "${2}/$(basename "${3}")"' \
      _ 'binstub' "${pkgdir}/usr/bin" '{}' ';'

  echo >&2 'Packaging documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'
}
