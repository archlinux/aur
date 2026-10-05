# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Sainnhe Park <sainnhe@gmail.com>
pkgname=basedpyright-git
_pkgname=basedpyright
pkgver=v1.40.1.r10.gfa4b52d94
pkgrel=1
pkgdesc="Fork of pyright, a static type checker for Python, with various improvements and new features"
arch=('any')
url="https://github.com/DetachHead/basedpyright"
license=('MIT')
depends=('nodejs')
makedepends=('pnpm' 'python' 'uv')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/DetachHead/basedpyright.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # git -C "${srcdir}/${_pkgname}" clean -dfx

  cd "${srcdir}/${_pkgname}"

  # Use system Python
  rm -f .python-version

  # ./build/generateAllDocstubs.sh
  uv sync --only-group=docstubs --no-install-project
  uv run --no-sync build/py_old/generate_docstubs.py

  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/${_pkgname}/packages/pyright"
  pnpm run build
}

package() {
  cd "${srcdir}/${_pkgname}"

  local target="${pkgdir}/usr/lib/node_modules/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin" "${target}"
  ln -s ../lib/node_modules/${_pkgname}/index.js "${pkgdir}/usr/bin/${_pkgname}"
  ln -s ../lib/node_modules/${_pkgname}/langserver.index.js "${pkgdir}/usr/bin/${_pkgname}-langserver"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  cp -r docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  cd packages/pyright
  cp -r dist {,langserver.}index.js package.json "$target"
}

# vim:set ts=2 sw=2 et:
