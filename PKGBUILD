# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
pkgver=0.10.14
pkgrel=2
pkgdesc='Python 2.7/3.X client for HashiCorp Vault'
url='https://python-hvac.org/'
license=(Apache)
arch=(any)
depends=(python python-requests python-six)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-authlib python-flask python-flask-sqlalchemy python-mock
              python-parameterized python-pyhcl python-requests-mock python-werkzeug python-jwcrypto
              vault consul)
optdepends=(
  'python-pyhcl: for parsing returned data'
)
source=("https://github.com/$_pkgname/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz"
        'flask.diff')
sha512sums=('3b3b5c64df5c57679a35e09cd61d29090c950dfaa11f64b4c3f8442a3ccf6512cc2d792f60e035815e4c4857813ba49612e0f52c5da3670bd692116a6bd28469'
            'ce5b56ef800b8e6fbf9f8d8097558ec6e98fd48a140b29a5e81a290eebe37369669b529a3e16fd873768a2591d4192ca2c7f88acca5f71873d47f94d8dc45899')

prepare() {
  # /usr/bin/vault not working in clean chroots as it requires CAP_IPC_LOCK
  # https://github.com/hashicorp/vault/issues/10048
  mkdir -p vault-unprivileged
  cp -v /usr/bin/vault vault-unprivileged/

  cd $_pkgname-$pkgver
  # hvac tests incorrect use Flask APIs, and an error is thrown sine Flask 2.0.1
  # https://github.com/pallets/flask/commit/7c5261407dae61679c268b44c63d73909c3fe652
  patch -Np1 -i ../flask.diff
}

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  # test_ldap requires many unpackaged dependencies
  PATH="$srcdir/vault-unprivileged:$PATH" pytest tests \
    --ignore=tests/integration_tests/api/auth_methods/test_ldap.py
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
