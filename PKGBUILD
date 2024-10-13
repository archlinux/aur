# Contributor: dreieck
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

_pkgname="neovim-nonicons"
pkgname="${_pkgname}-git"
pkgver=r39.20230204.ceda07d
pkgrel=1
pkgdesc="Icon set for neovim plugins and settings"
arch=('any')
url="https://github.com/yamatsum/nvim-nonicons"
license=('LicenseRef-unknown')
groups=('neovim-plugins')
depends=(
  'neovim'
  'ttf-nonicons'
)
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}.git"
  "license-unknown.txt"
)
sha256sums=(
  'SKIP'
  'd51e81054c5b69474aa1e7279810356ecc77ba0a8793bb496db60f230aad0c4e'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

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
  cd "${srcdir}/${_pkgname}"
  find lua \
    -type f -exec install -Dvm644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;

  install -Dvm644 README.md "${srcdir}/git.log" -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -Dvm644 "${srcdir}/license-unknown.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
