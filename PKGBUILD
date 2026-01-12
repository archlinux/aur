# Maintainer:
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

_pkgname="pyinfra"
pkgname="$_pkgname"
pkgver=3.6
pkgrel=2
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
  "$_pkgsrc.$_pkgext"::"https://github.com/pyinfra-dev/pyinfra/archive/v$pkgver.$_pkgext"
  '1525_remove_dsskey.patch'
)
sha256sums=(
  'f54177b0008a9d4deee60c2ba2f8de90aaca84fa6f30b50a236df472935c788c'
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
