# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
pkgname=pyright-inlay-hints-git
_pkgname=pyright
_pkgdirname=pyright-inlay-hints
pkgver=1.1.310.r40.gbe4a3b58d
pkgrel=1
pkgdesc="Static type checker for Python with inlay hint support"
arch=('any')
url="https://github.com/jbradaric/pyright-inlay-hints"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jbradaric/pyright-inlay-hints.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rm -rf "${pkgdir}/usr/lib/node_modules/${_pkgname}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm run install:all
  cd "${srcdir}/${_pkgname}/packages/pyright"
  npm run build
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  install -d "${pkgdir}/usr/share/doc/${_pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"

  cd "${srcdir}/${_pkgname}/packages/pyright/"

  cp -r dist "${pkgdir}/usr/lib/node_modules/${_pkgname}/dist"
  install -Dm755 index.js "${pkgdir}/usr/lib/node_modules/${_pkgname}/index.js"
  install -Dm755 langserver.index.js "${pkgdir}/usr/lib/node_modules/${_pkgname}/langserver.index.js"
  ln -s "/usr/lib/node_modules/${_pkgname}/index.js" "${pkgdir}/usr/bin/pyright"
  ln -s "/usr/lib/node_modules/${_pkgname}/langserver.index.js" "${pkgdir}/usr/bin/pyright-langserver"

  cd "${srcdir}/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${_pkgname}/CONTRIBUTING.md"
  cp -r docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
