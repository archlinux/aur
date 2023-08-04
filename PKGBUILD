# Maintainer: Index Dev Team <devteam@dogelonindex.org>

_distro="index"
_ns="indexdevteam"
_pkg="watch-token"
_pkgname="${_distro}-${_pkg}"
pkgname="${_pkgname}-git"
pkgver=1.0.3
pkgrel=2
pkgdesc='Facilitates adding tokens to MetaMask.'
url="https://${_ns}.github.io/${_pkg}"
_url="https://github.com/${_ns}/${_pkg}"
_url_local="ssh://git@localhost:/home/git/${_pkg}"
license=('MIT')
arch=('any')
depends=(
  # 'apache'
  nodejs-serve 
)
provides=(
  "${_pkgname}" "${_pkg}"
)
makedepends=(
  'git'
  'npm'
  'nodejs-lts-gallium'
  'yarn'
)
source=(
  "${_pkg}::git+${_url}"
  # "${_pkg}::git+${_url_local}"
  "${_pkg}.sh"
  "env.json"
)
sha512sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cp env.json \
     "${srcdir}/${_pkg}/.vuepress/.env.json"
  # cp env.json \
  #    "${srcdir}/${_pkg}/.vuepress/.env"
}

build() {
  cd "${srcdir}/${_pkg}" || exit
  npm install .
  npm audit fix --force || true
  npm run-script lint
  npm run-script lint:fix
  npm run-script build
}

package() {
  cd "${srcdir}"
  local _dest="${pkgdir}/usr/share/${_pkg}"
  local _bin="${pkgdir}/usr/bin"
  mkdir -p "${_dest}"
  mkdir -p "${_bin}"
  cp -r "${_pkg}/.vuepress/dist/"* "${_dest}"
  install -Dm755 "${_pkg}.sh" "${_bin}/${_pkg}"
}

# vim:set sw=2 sts=-1 et:
