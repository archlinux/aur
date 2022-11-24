# Maintainer: Index Dev Team <devteam@dogelonindex.org>

_distro="index"
_namespace="indexdevteam"
_pkg="tokenlists-org"
_pkgname="${_distro}-${_pkg}"
pkgname="${_pkgname}"
pkgver=1.0
pkgrel=1
pkgdesc='A site for browsing featured token lists.'
url="https://${_namespace}.github.io/${_pkg}"
_url="https://github.com/${_namespace}/${_pkg}"
license=('MIT')
arch=('any')
depends=('apache')
provides=("${_pkg}")
makedepends=('npm' 'nodejs' 'yarn')
source=("${_pkg}::git+${_url}#tag=${pkgver}"
	"${_pkg}.sh"
        "bg.png")
sha256sums=('SKIP'
            '4a8bebdd02389f8a21945831c90cdbd5a91ceffb408fb1891ae738738706f034'
            'd2ef7330273922b849682fcab38a220eb23337fb0e5a2373ec32efa76b6d933e')

prepare() {
  cp "bg.png" "${srcdir}/${_pkg}/src"
}

build() {
  cd "${srcdir}/${_pkg}" || exit
  NODE_OPTIONS="--openssl-legacy-provider" npm install --production \
                                                       react-scripts@4.0.3
  NODE_OPTIONS="--openssl-legacy-provider" npm audit fix || true
  NODE_OPTIONS="--openssl-legacy-provider" npm install .
  NODE_OPTIONS="--openssl-legacy-provider" npm audit fix || true
  NODE_OPTIONS="--openssl-legacy-provider" npm run-script build
}

package() {
  cd "${srcdir}"
  local _dest="${pkgdir}/usr/share/${_pkg}"
  local _bin="${pkgdir}/usr/bin"
  mkdir -p "${_dest}"
  mkdir -p "${_bin}"
  cp -r "${_pkg}/build/"* "${_dest}"
  install -Dm755 "${_pkg}.sh" "${_bin}/${_pkg}"
}
