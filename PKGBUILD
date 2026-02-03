# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Benoit Pierre <benoit.pierre@gmail.com>
# Contributor: LinArcX <LinArcX at gmail . com>
_base=requests-cache
pkgname=python-${_base}-git
_pkgname=${pkgname%-git}
pkgdesc="A persistent cache for python requests (git version)"
pkgver=1.3.0.r1.gdaf1c8f
pkgrel=1
arch=(any)
url="https://github.com/requests-cache/${_base}"
license=(BSD-2-clause)
depends=(python-requests python-cattrs python-platformdirs python-url-normalize)
makedepends=(python-build python-installer python-hatchling git)
optdepends=('python-boto3: Cache backend for Amazon DynamoDB database'
  'python-botocore: Interface for Amazon Web Services'
  'python-pymongo: Cache backend for MongoDB database'
  'python-redis: Cache backend for Redis cache'
  'python-itsdangerous: for pass trusted data to untrusted environments'
  'python-yaml: for bindings yaml support'
  'python-ujson: for JSON serializer for improved performance') # python-sphinx-furo python-linkify-it-py python-myst-parser
checkdepends=(python-pytest python-requests-mock python-responses python-rich)
source=("git+${url}")
sha512sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
  cd ${_base}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m pytest \
    --ignore=tests/integration \
    --ignore=tests/unit/test_session.py \
    --ignore=tests/unit/test_base_cache.py
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
