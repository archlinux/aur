# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
# https://github.com/hvac/hvac/releases
pkgver=2.2.0
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
sha512sums=('9b03eac3d10cd60d3289eab23030f433234d066e4af5a7a7912dcaf7d7b06eb1bd2ab657b192438ac18c321aa5cdb023abc2877af2065249a70c377539201d55')

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
  PATH="$srcdir/vault-unprivileged:$PATH" pytest tests \
    --ignore=tests/integration_tests/api/auth_methods/test_ldap.py
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
