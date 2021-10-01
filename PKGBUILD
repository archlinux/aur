# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: LinArcX <LinArcX at gmail . com>
_base=requests-cache
pkgname=python-${_base}-git
_pkgname=${pkgname%-git}
pkgdesc="Transparent persistent cache for http://python-requests.org library (git version)"
pkgver=0.8.1.r20.g217397b
pkgrel=1
arch=('any')
url="https://github.com/reclosedev/${_base}"
license=('custom:BSD-2-clause')
depends=(python-requests python-url-normalize python-cattrs python-appdirs)
makedepends=(python-build python-install python-poetry git)
optdepends=('python-boto3: Cache backend for Amazon DynamoDB database'
  'python-redis: Cache backend for Redis cache'
  'python-pymongo: Cache backend for MongoDB database') # python-botocore python-yaml python-sphinx-furo python-linkify-it-py python-myst-parser
checkdepends=(python-pytest python-requests-mock python-responses python-itsdangerous python-ujson python-timeout-decorator)
# python-pymongo python-redis redis python-boto3
source=("git+${url}")
sha512sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
  cd "${_base}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_base}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_base}"
  python -m pytest --ignore=tests/integration
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
