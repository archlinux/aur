# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=jenv-archlinux
pkgver=0.1.0
pkgrel=1
pkgdesc='Various jenv subcommands for Arch Linux'
arch=('any')
url='https://github.com/claui/jenv-archlinux'
license=('Apache')
depends=('jenv')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/jenv-archlinux/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '0cd0381cd5c8fd328d90d08912c2649fc791344592857f1bbad705451b83012dd00ba8073e9910447ae3689c428145760052ba566a692adef9539a4dd519f966'
)

build() {
  echo >&2 'Preparing the binstub'
  mkdir -p "${srcdir}"
  # shellcheck disable=SC2016
  printf '#!/bin/bash\n%s\n' > "${srcdir}/binstub" \
    'exec "/usr/lib/'"${pkgname}"'/bin/$(basename "${0}")" "$@"'
}

package() {
  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/LICENSE"

  echo >&2 'Packaging scripts'
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r --preserve=mode -t "${pkgdir}/usr/lib/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/"{bin,libexec}

  echo >&2 'Packaging binstubs'
  find "${srcdir}/${pkgname}-${pkgver}/bin" \
    -mindepth 1 \
    -regex '.*/[^.]+' \
    -exec bash -c '
      printf >&2 "\\t- %s\\n" "$(basename "${1}")"
      install -D -m 755 -T \
        "${2}"/binstub "${3}"/usr/bin/$(basename "${1}")
      ' _ '{}' "${srcdir}" "${pkgdir}" ';'

  echo >&2 'Packaging documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${pkgname}-${pkgver}/README.md"
}
