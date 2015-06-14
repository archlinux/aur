# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
_pkgname="inkscape-open-symbols"
pkgname="${_pkgname}-git"
pkgver=r27.edaad3d
pkgrel=1
pkgdesc="Open source icon sets to use as Inkscape symbols"
arch=('any')
url="https://github.com/Xaviju/inkscape-open-symbols"
license=('custom')
depends=('inkscape')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/Xaviju/inkscape-open-symbols.git"
        'https://raw.githubusercontent.com/google/material-design-icons/ac6812576bce556dd736f6f28a42e15cdf386b6e/LICENSE')
md5sums=('SKIP'
         '30cdba52b170859bf6e7ec48a1e43dda')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p "${pkgdir}/usr/share/inkscape/symbols"
  for i in material-design octicons humble-ui suru-icons font-awesome; do
    find "$i" -mindepth 1 -iname '*.svg' \
         -exec 'cp' '{}' "${pkgdir}/usr/share/inkscape/symbols" ';'
  done

  mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
  cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
