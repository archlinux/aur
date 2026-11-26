# Maintainer: Norbert Preining <norbert@preining.info>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Julian Weigt <juw@posteo.de>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=msal
pkgname=python-$_name
pkgver=1.39.0
pkgrel=2
pkgdesc="Authenticate with Microsoft Entra (Azure Active Directory) accounts using OAuth2 and OpenID Connect"
arch=('any')
url="https://github.com/AzureAD/microsoft-authentication-library-for-python"
license=('MIT')
depends=('python'
         'python-requests'
         'python-pyjwt'
         'python-cryptography')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-benchmark'
              'python-perf_baseline')
optdepends=('python-pymsalruntime: broker')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0228c50e8c55d846f3882d535d06f986d37fac20f7a2f52f908632beccc851f3')

build() {
  cd "microsoft-authentication-library-for-python-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --ignore=tests/test_agentic_e2e.py
    --ignore=tests/test_e2e.py
    --ignore=tests/test_e2e_manual.py
    --ignore=tests/test_fmi_e2e.py
  )
  cd "microsoft-authentication-library-for-python-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "microsoft-authentication-library-for-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
