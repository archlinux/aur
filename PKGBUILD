# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Sainnhe Park <sainnhe@gmail.com>
pkgname=basedpyright-git
_pkgname=basedpyright
pkgver=v1.32.1.r23.gf88523c13
pkgrel=1
pkgdesc="Fork of pyright, a static type checker for Python, with various improvements and new features"
arch=('any')
url="https://github.com/DetachHead/basedpyright"
license=('MIT')
depends=('nodejs' 'python')
makedepends=('npm' 'python-installer' 'uv')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/DetachHead/basedpyright.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${_pkgname}"
  uv build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  cp -r docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  # Run JS scripts directly, without nodejs_wheel
  _pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  rm "${pkgdir}/usr/bin/basedpyright" "${pkgdir}/usr/bin/basedpyright-langserver"
  ln -s ../lib/python${_pyver}/site-packages/${_pkgname}/index.js "${pkgdir}/usr/bin/basedpyright"
  ln -s ../lib/python${_pyver}/site-packages/${_pkgname}/langserver.index.js "${pkgdir}/usr/bin/basedpyright-langserver"
}

# vim:set ts=2 sw=2 et:
