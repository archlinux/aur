# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=aur-pull
pkgver=0.1.1
pkgrel=2
# shellcheck disable=SC2016  # No interpolation wanted
pkgdesc='Plugin for aurutils to `git pull` multiple repositories'
arch=('any')
url='https://github.com/claui/aur-pull'
license=('Apache-2.0')
depends=(
  'bash'
  'findutils'
  'git'
  'parallel'
  'python'
  'python-dotty-dict'
  'python-tomlkit'
)
makedepends=('python-myst-parser' 'python-sphinx')
optdepends=('aurutils: as a plugin host')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/claui/aur-pull/archive/v${pkgver}.tar.gz"
)

sha512sums=('dd4dab5af8f1ae55500f4019748dad6b93fcb70da10b01ccb6bd2d1ddd4ac639178dfcc903d0d8c7034bdae0c5bb418fba8a27b6ee8b2b1fe1713301cdf71d20')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Removing unneeded files'
  for dir in 'bin' 'libexec'; do
    find "${dir?}" -name '.*' -exec rm -fv '{}' +
  done

  echo >&2 'Patching the version number'
  sed -i "s/0.1.0/${pkgver}/" libexec/version.bash

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
