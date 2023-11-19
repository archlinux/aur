# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
# https://github.com/hvac/hvac/releases
pkgver=2.0.0
pkgrel=1
pkgdesc='Python 2.7/3.X client for HashiCorp Vault'
url='https://python-hvac.org/'
license=(Apache)
arch=(any)
depends=(python python-requests)
makedepends=(python-build python-installer python-poetry-core vault
             python-pyhcl)
checkdepends=(python-pytest python-authlib python-flask python-flask-sqlalchemy
              python-parameterized python-requests-mock python-werkzeug python-jwcrypto
              python-pytest-mock
              consul)
optdepends=(
  'python-pyhcl: for HCL parser'
)
source=("https://github.com/$_pkgname/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz"
        "$pkgname-vault-1.15.patch::https://github.com/hvac/hvac/commit/f57cc043396569a44dfa49866f1074b42bbff4f7.patch"
        "mock.diff")
sha512sums=('4ba4882a006e2c61f272f918c2388d99c1393d5986dc82ccd6c4474f2f0bb5848fcea2aa2346e503216b394675566e1c4865f6ba2bd726ecee8d4a84cd097c81'
            '964cec6c1c7379d6411de72a2f308073ad2fb9b7c9654c89519f069a16af079afffdd48c9e2efcfb4ab182aea4b2e8b3668b8b58590d37966534738cb56bf9aa'
            '24ed5c628e1e1b4ba9f3e49d62294ba03522d1052da8c0082256b354806f2f30ff611fb5a68f7e8a8a530247b03b57c0c8eaa49514374882b45f4e37353a5d77')

prepare() {
  # /usr/bin/vault not working in clean chroots as it requires CAP_IPC_LOCK
  # https://github.com/hashicorp/vault/issues/10048
  mkdir -p vault-unprivileged
  cp -v /usr/bin/vault vault-unprivileged/

  cd $_pkgname-$pkgver
  # Fix compatibility with vault 1.15
  # https://github.com/hvac/hvac/pull/1103 (merged)
  patch -Np1 -i ../$pkgname-vault-1.15.patch
  patch -Np1 -i ../mock.diff
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
