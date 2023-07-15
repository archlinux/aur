# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-bonsai')
_name=${pkgname#python-}
pkgver=1.5.1
pkgrel=1
pkgdesc="Python module for LDAPv3 using libldap2/WinLDAP"
arch=('x86_64')
url='https://github.com/noirello/bonsai'
license=('MIT')
makedepends=('python-setuptools')
depends=('libldap>=2' 'libsasl>=2' 'python>=3.6' 'krb5')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-timeout')
optdepends=('python-gevent: enable bonsai.gevent'
            'python-tornado: enable bonsai.tornado'
            'python-trio: enable bonsai.trio')
options=(!emptydirs)
sha256sums=('9fc83ff9b94ac029ccedbc01ce96d1ac7b9ad2228ceaff8aba5fe622861cebe4')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  py3_suffix=$(python -V | sed -r 's/.*3\.([0-9]+)\..*/3\1/')
  PYTHONPATH="build/lib.linux-$arch-cpython-$py3_suffix" \
    python -m pytest -k 'not (test_asyncio or test_gevent or'` \
      `' test_ldapclient or test_ldapconnection or test_ldapentry or'` \
      `' test_ldapreference or test_pool or test_tornado or test_trio or'` \
      `' test_utils)'
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
