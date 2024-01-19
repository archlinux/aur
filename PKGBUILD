# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
# https://github.com/hvac/hvac/releases
pkgver=2.1.0
pkgrel=1
pkgdesc='Python 2.7/3.X client for HashiCorp Vault'
url='https://python-hvac.org/'
# The license defined at https://github.com/hvac/hvac/blob/v2.1.0/pyproject.toml#L17
license=('Apache-2.0')
arch=(any)
depends=(python python-requests)
makedepends=(python-build python-installer python-poetry-core vault
             python-pyhcl)
checkdepends=(python-pytest python-authlib python-flask python-flask-sqlalchemy
              python-parameterized python-requests-mock python-werkzeug python-jwcrypto
              python-pytest-mock python-pytest-xdist
              consul)
optdepends=(
  'python-pyhcl: for HCL parser'
)
source=("https://github.com/$_pkgname/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('793200196867432f1c277ec499348e87c7afb91e1e204733fc8f79d93f4d13c4ab0f4f5618c5efb93c5771c3a68de103cb0beb4075c4d5c19afcea385940948b')

prepare() {
  # /usr/bin/vault not working in clean chroots as it requires CAP_IPC_LOCK
  # https://github.com/hashicorp/vault/issues/10048
  mkdir -p vault-unprivileged
  cp -v /usr/bin/vault vault-unprivileged/
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  # test_ldap requires many unpackaged dependencies
  PATH="$srcdir/vault-unprivileged:$PATH" pytest tests \
    --ignore=tests/integration_tests/api/auth_methods/test_ldap.py
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
