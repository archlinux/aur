# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
# https://github.com/hvac/hvac/releases
pkgver=0.11.2
pkgrel=4
pkgdesc='Python 2.7/3.X client for HashiCorp Vault'
url='https://python-hvac.org/'
license=(Apache)
arch=(any)
depends=(python python-requests python-six)
makedepends=(python-setuptools vault)
checkdepends=(python-pytest python-authlib python-flask python-flask-sqlalchemy python-mock
              python-parameterized python-pyhcl python-requests-mock python-werkzeug python-jwcrypto
              consul)
optdepends=(
  'python-pyhcl: for parsing returned data'
)
# Upstream intentionally prune tests from sdists (https://github.com/hvac/hvac/pull/356)
source=("https://github.com/$_pkgname/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('7a3cb82e17e7ceef04173c8682b33d35457675eae7b402ba36c3a21026ebf551a2731ecbd6dc0d00bb727e98a29f0a0f5bf427d7429b55b922247b4ccfb79794')

prepare() {
  # /usr/bin/vault not working in clean chroots as it requires CAP_IPC_LOCK
  # https://github.com/hashicorp/vault/issues/10048
  mkdir -p vault-unprivileged
  cp -v /usr/bin/vault vault-unprivileged/
}

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  # test_ldap requires many unpackaged dependencies
  # some tests are disabled due to incompatibility with vault 1.9 https://github.com/hvac/hvac/issues/786
  PATH="$srcdir/vault-unprivileged:$PATH" pytest tests \
    --ignore=tests/integration_tests/api/auth_methods/test_ldap.py \
    -k 'not test_oidc_authorization_url_request_0_success and not test_delete_config_0_create_and_then_delete_config and not test_auth_kubernetes'
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
