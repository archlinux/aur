# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
# https://github.com/hvac/hvac/releases
pkgver=1.1.1
pkgrel=1
pkgdesc='Python 2.7/3.X client for HashiCorp Vault'
url='https://python-hvac.org/'
license=(Apache)
arch=(any)
depends=(python python-pyhcl python-requests)
makedepends=(python-build python-installer python-poetry-core vault)
checkdepends=(python-pytest python-authlib python-flask python-flask-sqlalchemy
              python-parameterized python-requests-mock python-werkzeug python-jwcrypto
              consul)
# Upstream intentionally prune tests from sdists (https://github.com/hvac/hvac/pull/356)
source=("https://github.com/$_pkgname/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('f5de49b33c257ccfcdc662ed269e843d3f76912bc2e773663e72c8425d1ccc317cdc137dc7bb978e0e966bc6248f34953306fc919fba2cc8f97f0a695b5daf2b')

prepare() {
  # /usr/bin/vault not working in clean chroots as it requires CAP_IPC_LOCK
  # https://github.com/hashicorp/vault/issues/10048
  mkdir -p vault-unprivileged
  cp -v /usr/bin/vault vault-unprivileged/

  cd $_pkgname-$pkgver
  # workaround https://github.com/hvac/hvac/issues/905
  sed -i '/use_microsoft_graph_api/d' tests/integration_tests/api/secrets_engines/test_azure.py
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  # test_ldap requires many unpackaged dependencies
  # dynamic SSH key support was dropped in vault 1.13 https://developer.hashicorp.com/vault/docs/v1.12.x/deprecation
  PATH="$srcdir/vault-unprivileged:$PATH" pytest tests \
    --ignore=tests/integration_tests/api/auth_methods/test_ldap.py \
    -k 'not test_create_key and not test_delete_key'
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
