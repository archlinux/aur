# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago França<tfsthiagobr98@outlook.com>
_pkgname=poetry-core
pkgname=python-${_pkgname}-git
pkgver=1.8.1.r17.g21b0033
pkgrel=1
pkgdesc="Poetry PEP 517 Build Backend"
arch=(any)
url="https://github.com/python-poetry/${_pkgname}"
license=('MIT')
_deps=(fastjsonschema lark-parser packaging)
depends=("${_deps[@]/#/python-}")
makedepends=(python-{build,installer} git)
# checkdepends=(python-pytest python-pytest-mock python-virtualenv)
source=(git+${url})
sha512sums=('SKIP')
provides=(${_pkgname} python-${_pkgname})
conflicts=(${_pkgname} python-${_pkgname})

pkgver() {
  cd ${_pkgname}
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${_pkgname}
  # remove vendored dependencies
  sed -i '/^__version__/!d' src/poetry/core/__init__.py
  rm -r src/poetry/core/_vendor
  rm poetry.lock
  rm vendors/poetry.lock
}

build() {
  cd ${_pkgname}
  python -m build -wn
}

# check() {
#   cd ${_pkgname}
#   pytest
# }

package() {
  cd ${_pkgname}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
