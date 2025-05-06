# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-nativeauthenticator-git
pkgdesc="Authenticator for storing users in the JupyterHub database (Git version)"
pkgver=1.3.0.r5.gf800bd3
pkgrel=1
url="https://github.com/jupyterhub/nativeauthenticator"
license=('BSD-3-Clause')
arch=('any')

provides=('jupyterhub-nativeauthenticator')
conflicts=('jupyterhub-nativeauthenticator')

depends=(
  'jupyterhub'
  'python-bcrypt'
  'python-onetimepass'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'jupyter-notebook'
)

source=(
  'git+https://github.com/jupyterhub/nativeauthenticator.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd nativeauthenticator
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd nativeauthenticator
  python -m build --wheel --no-isolation
}

check() {
  cd nativeauthenticator
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/jupyterhub_nativeauthenticator-*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd nativeauthenticator
  python -m installer --destdir="$pkgdir" dist/jupyterhub_nativeauthenticator-*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Don't package the unit tests.
  rm -rf "$pkgdir/"usr/lib/python*/site-packages/nativeauthenticator/tests
}
