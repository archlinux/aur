# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Michal Wojdyla (https://aur.archlinux.org/account/micwoj92)
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname=raleigh-reloaded-git
pkgver=1.7+2.r165.20250511.1a30aa3
pkgrel=1
pkgdesc="A GTK theme aiming to revive the classic Raleigh theme"
arch=('any')
url="https://github.com/vlastavesely/raleigh-reloaded"
license=('GPL2')
depends=()
optdepends=(
  # 'gtk2: To use the theme in GTK+.' # It is part of GTK2, so no need to relate this package to GTK2.
  'gtk3>=3.20: To use the theme in GTK3.'
  # 'firefox: To use the theme in firefox.'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  _ver="$(git describe --long | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX="$pkgdir"/usr install

  for _docfile in README.md screenshot.png doc/*; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname%-git}/${_docfile}"
  done
  for _licensfile in LICENSE.md; do
    install -Dvm644 "${_licensfile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensfile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensfile}" "${pkgdir}/usr/share/doc/${pkgname%-git}/${_licensfile}"
  done
}
