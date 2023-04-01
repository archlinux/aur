# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pytest-localftpserver
pkgdesc='PyTest plugin providing a local FTP server'
pkgver=1.1.4
pkgrel=1
arch=('any')
url='https://pytest-localftpserver.readthedocs.io/'
license=('MIT')

# pyopenssl is an optional dependency of pyftpdlib; it is needed to provide
# some of the classes this package depends on.
depends=('python-pyftpdlib' 'python-pyopenssl' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

_pypi=pytest_localftpserver
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'replace_wget.patch'
)
sha256sums=(
  'acc181bfafc1f64befda90bc3bf2fbcd7886165a57921f57c21199a13aeffca7'
  'adbdf668a10a06ecb62dd1ba8502718959d0cc0d86f00584e7d9f3db4f34ce79'
)

prepare() {
  cd "$_pypi-$pkgver"
  patch -p0 -i "$srcdir/replace_wget.patch"
}

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"

  # Tell pytest to load the plugin.
  export PYTHONPATH=build/lib
  export PYTEST_PLUGINS=pytest_localftpserver.plugin

  # Run tests which don't load environment variables.
  pytest -v --ignore=tests/test_pytest_localftpserver_with_env_var.py

  # And then set the environment and run those tests.
  export FTP_USER=benz
  export FTP_PASS=erni1
  export FTP_PORT=31175
  export FTP_PORT_TLS=31176
  export FTP_CERTFILE="$(pwd)/tests/test_keycert.pem"
  mkdir -p tests/envvar_homedir
  export FTP_HOME="$(pwd)/tests/envvar_homedir"
  export FTP_HOME_TLS="$(pwd)/tests/envvar_homedir"
  export FTP_FIXTURE_SCOPE=function
  pytest -v tests/test_pytest_localftpserver_with_env_var.py
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
