# Maintainer:
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

_pkgname="pyinfra"
pkgname="$_pkgname"
pkgver=3.6.1
pkgrel=1
pkgdesc="Automate infrastructure super fast at massive scale"
url="https://github.com/pyinfra-dev/pyinfra"
license=('MIT')
arch=('any')

depends=(
  'python'
  'python-click'
  'python-dateutil'
  'python-distro'
  'python-gevent'
  'python-jinja'
  'python-packaging'
  'python-paramiko'
  'python-typeguard'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-hatch'
  'python-installer'
  'python-wheel'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext"
  '1525_remove_dsskey.patch'
)
sha256sums=(
  '359ed8170ae1110bb3f8baf77cd6d765847c87d56118d6449d17e786eb8b16f5'
  '6e83a040153db0762e4ae632fa06b82e1af21addf6c1deed98f8f8a8c0ca49e3'
)

prepare() (
  python -m venv venv
  source ./venv/bin/activate
  pip install toml-cli

  cd "$_pkgsrc"
  rm -rf tests

  # uv-dynamic-versioning doesn't work with tarball
  toml set --toml-path pyproject.toml build-system.requires '["hatchling"]' --to-array
  toml unset --toml-path pyproject.toml project.dynamic
  toml unset --toml-path pyproject.toml tool.hatch.version
  toml set --toml-path pyproject.toml project.version "$pkgver"

  patch -Np1 -F100 -i ../1525_remove_dsskey.patch
)

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
