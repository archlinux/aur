# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
# https://github.com/hvac/hvac/releases
pkgver=2.3.0
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
sha512sums=('d08f7228ab57cd33428f530b14942dcf64b6efebe7589959f4ca3fc021f5da39af6441746417f80f7474d6a7bfb7a0ac94006a64ecf37967d4983698e95241f1')

prepare() {
  # /usr/bin/vault not working in clean chroots as it requires CAP_IPC_LOCK
  # https://github.com/hashicorp/vault/issues/10048
  mkdir -p vault-unprivileged
  cp -v /usr/bin/vault vault-unprivileged/

  cd $_pkgname-$pkgver

  # Disabling parallel tests. Somehow a test in test_identity.py fails
  sed -i '/addopts/d' pyproject.toml
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  # test_ldap requires many unpackaged dependencies
  # test_cert: some tests fail with requests 2.32 https://github.com/hvac/hvac/issues/1177
  PATH="$srcdir/vault-unprivileged:$PATH" pytest tests \
    --ignore=tests/integration_tests/api/auth_methods/test_ldap.py \
    --ignore=tests/integration_tests/api/auth_methods/test_cert.py
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
