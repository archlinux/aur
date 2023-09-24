# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
# https://github.com/hvac/hvac/releases
pkgver=1.2.1
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
source=("https://github.com/$_pkgname/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz"
        "$pkgname-flask-2.3.patch"::"https://github.com/hvac/hvac/commit/b613cda385faef936eb0926ed49a20decf71f16d.patch")
sha512sums=('061182fe529a266ce7b0476809a69f73cd0f88cef194301547e3b8d240bf2fc40c0f83cb41a8f2e6cdd42ec08ee34dcb8f14321b700fe6ba6e1a99c3c92901a2'
            '05f7f4992d56065f3ad293b82bc884e92b51595cb56346c1d106645c9f95bb8ffb5f4cae3c7d130e19e67505f155314aabaf7558073d7ee8b2480572a9a2e691')

prepare() {
  # /usr/bin/vault not working in clean chroots as it requires CAP_IPC_LOCK
  # https://github.com/hashicorp/vault/issues/10048
  mkdir -p vault-unprivileged
  cp -v /usr/bin/vault vault-unprivileged/

  cd $_pkgname-$pkgver
  # Fix compatibility with Flask 2.3
  # Part of https://github.com/hvac/hvac/pull/1048 (merged)
  patch -Np1 -i ../$pkgname-flask-2.3.patch
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
