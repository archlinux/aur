# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Antheas Kapenekakis (https://aur.archlinux.org/account/antheas)

_pkgbase=hhd-ui
_vcssuffix="-git"
pkgbase="${_pkgbase}${_vcssuffix}"
pkgname=(
  "${pkgbase}"
)
pkgver=3.2.3+1.r424.20241102.fcab46e
pkgrel=1
pkgdesc="Browser based user interface for 'hhd' (\"Handheld Daemon\"). Latest git checkout."
arch=(
  'any'
)
url='https://github.com/hhd-dev/hhd-ui'
license=('MIT')

makedepends=(
  'git'
  'npm'
)
source=(
  "${_pkgbase}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)


prepare() {
  cd "${srcdir}/${_pkgbase}"

  export NPM_DIR="${srcdir}/.npm"
  export NVM_DIR="${srcdir}/.nvm"
  export npm_config_cache="${srcdir}/.npm"
  export NODE_ENV="production"

  printf '%s\n' '  > Downloading npm dependencies ...'
  npm ci

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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

build() {
  cd "${srcdir}/${_pkgbase}"

  export NPM_DIR="${srcdir}/.npm"
  export NVM_DIR="${srcdir}/.nvm"
  export npm_config_cache="${srcdir}/.npm"
  export NODE_ENV="production"
}

package_hhd-ui-git() {
  depends=(
    'hhd'
  )
  optdepends=()
  provides=(
    "${_pkgbase}=${pkgver}"
  )
  conflicts=(
    "${_pkgbase}"
  )

  cd "${srcdir}/${_pkgbase}"


  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" git.log README.md

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgbase}" LICENSE
  ln -svr "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgbase}/LICENSE"
}
