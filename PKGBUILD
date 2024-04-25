# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Sainnhe Park <sainnhe@gmail.com>
pkgname=basedpyright-git
_pkgname=basedpyright
pkgver=v1.10.4.r0.g52051238a
pkgrel=1
pkgdesc="Fork of pyright, a static type checker for Python, with various improvements and new features"
arch=('any')
url="https://github.com/DetacHead/basedpyright"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/DetachHead/basedpyright.git")
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
  ln -s "/usr/lib/node_modules/${_pkgname}/index.js" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/usr/lib/node_modules/${_pkgname}/langserver.index.js" "${pkgdir}/usr/bin/${_pkgname}-langserver"

  cd "${srcdir}/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${_pkgname}/CONTRIBUTING.md"
  cp -r docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
