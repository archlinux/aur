# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: David Vilar Benet <archlinux at b0rken dot de>

_pkgname=hvac
pkgname=python-$_pkgname
pkgver=0.11.0
pkgrel=1
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
# Upstream intentionally prune tests from sdists (https://github.com/hvac/hvac/pull/356)
source=("https://github.com/$_pkgname/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('47226ba5113a4df48f115d02d2fb1fa7ab8b42895d38f7fad37c84814db71a57f4e455a9b46134bb577fbded1881e6272464b9f1d1d74142dc089bde03b0eba9')

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
  PATH="$srcdir/vault-unprivileged:$PATH" pytest tests \
    --ignore=tests/integration_tests/api/auth_methods/test_ldap.py
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
