# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=jenv-archlinux
pkgver=0.1.0
pkgrel=2
pkgdesc='Various jenv subcommands for Arch Linux'
arch=('any')
url='https://github.com/claui/jenv-archlinux'
license=('Apache-2.0')
depends=('jenv')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/jenv-archlinux/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '0cd0381cd5c8fd328d90d08912c2649fc791344592857f1bbad705451b83012dd00ba8073e9910447ae3689c428145760052ba566a692adef9539a4dd519f966'
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
