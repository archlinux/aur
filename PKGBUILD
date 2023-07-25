# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
_themename='smallscreen-raleigh-compact'
pkgname="xfwm4-theme-${_themename}-git"
pkgver=r16.20230725.8038dc8
pkgrel=1
pkgdesc="An Xfwm4 theme using only the necessary screen space and trying to imitate the 'raleigh' colour theme."
arch=('any')
url="https://gitlab.com/dreieckli/xfwm4-theme-${_themename}"
license=('GPL3')
depends=()
optdepends=(
  'xfwm4>=3.20: To use the theme.'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
optdepends=('raleigh-reloaded: For a matching GTK3 application theme.')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  # _ver="$(git describe --long | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  mkdir -p "${pkgdir}/usr/share/themes/${_themename}"
  cp -rv "themes/${_themename}"/* "${pkgdir}/usr/share/themes/${_themename}"/

  for _docfile in git.log README.md screenshot.png logo.png; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname%-git}/${_docfile}"
  done
  for _licensfile in COPYING.md; do
    install -Dvm644 "${_licensfile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensfile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensfile}" "${pkgdir}/usr/share/doc/${pkgname%-git}/${_licensfile}"
  done
}
