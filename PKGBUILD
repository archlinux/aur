# Maintainer: Carter Green <crtrgreen at gmail dot com>

_pkgname=assemblyscript
pkgname=assemblyscript-git
pkgver=v0.19.16.r1.g250dc70b4
pkgrel=2
pkgdesc="Compiles TypeScript to WebAssembly using Binaryen"
arch=('any')
url="https://github.com/AssemblyScript/${_pkgname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm' 'git' 'jq')
source=("${_pkgname}::git+${url}#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  npm pack "${srcdir}/${_pkgname}"
  npm install -g --user root --prefix "${pkgdir}/usr" "${_pkgname}-0.0.0.tgz"
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

