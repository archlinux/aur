# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Sainnhe Park <sainnhe@gmail.com>
pkgname=basedpyright-git
_pkgname=basedpyright
pkgver=v1.39.2.r0.gceb200c19
pkgrel=1
pkgdesc="Fork of pyright, a static type checker for Python, with various improvements and new features"
arch=('any')
url="https://github.com/DetachHead/basedpyright"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'python' 'uv')
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
  uv run --no-sync build/py3_8/generate_docstubs.py

  npm ci
}

build() {
  cd "${srcdir}/${_pkgname}/packages/pyright"
  npm run build
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
