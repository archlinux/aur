# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Benoit Pierre <benoit.pierre@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Aniket Pradhan <aniket17133[at]iiitd[dot]ac[dot]in>
# Contributor: Roman Haritonov <reclosedev[at]gmail[dot]com>
_base=requests-cache
pkgname=python-${_base}
pkgdesc="Transparent persistent cache for http://python-requests.org library"
pkgver=0.8.1
pkgrel=4
arch=('any')
url="https://github.com/reclosedev/${_base}"
license=('custom:BSD-2-clause')
depends=(python-requests python-url-normalize python-cattrs python-appdirs)
makedepends=(python-build python-install python-poetry)
optdepends=('python-boto3: Cache backend for Amazon DynamoDB database'
  'python-redis: Cache backend for Redis cache'
  'python-pymongo: Cache backend for MongoDB database')
checkdepends=(python-pytest python-requests-mock python-responses python-itsdangerous python-ujson python-timeout-decorator)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('245ee7059afab50f32af9c8831fe11c14d5bd53fe6bbf02e5844974e0e5ea6c33e005f234485f245ee418ae03277c6e2cc41046a385ff138e58785cf37b119ea')

build() {
  cd "${_base}-${pkgver}"
  # Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
  # from incorrectly using a parent git checkout info.
  # https://github.com/pypa/build/issues/384#issuecomment-947675975
  GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest --ignore=tests/integration
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
