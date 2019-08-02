# Maintainer: Carter Green <crtrgreen at gmail dot com>

_pkgname=assemblyscript
pkgname=assemblyscript-git
pkgver=0.7.0.r682.227c6269
pkgrel=1
pkgdesc="Compiles TypeScript to WebAssembly using Binaryen"
arch=('any')
url="https://github.com/AssemblyScript/${_pkgname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm' 'git')
source=("${_pkgname}::git+${url}#branch=master")
sha256sums=('SKIP')

get_pkgver() {
  _pkgver=$(node -pe "require('${srcdir}/${_pkgname}/package.json').version")
}

pkgver() {
  get_pkgver
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

package() {
  get_pkgver
  npm pack "${srcdir}/${_pkgname}"
  npm install -g --user root --prefix "${pkgdir}/usr" "${_pkgname}-${_pkgver}.tgz"
  find "${pkgdir}" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/${_pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}

