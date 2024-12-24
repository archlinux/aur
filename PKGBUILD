# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=python-varname
pkgname=${_pkgname}-git
pkgver=0.13.0.r0.gea1ec82
pkgrel=4
pkgdesc="A Python library to retrieve variable names from functions or classes -- git version"
arch=('any')
url="https://github.com/pwwang/${_pkgname}"
license=('MIT')
depends=('python' 'python-executing')
optdepends=('python-asttokens' 'python-pure-eval')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
  cd "${_pkgname}"
	## skip dependency check because of pinned deps
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
