# Maintainer: aur.chaotic.cx
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

_pkgname="pyinfra"
pkgname="$_pkgname"
pkgver=3.9.2
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
  'python-pydantic'
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
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('705576e62657b2ee5277e52f917aff152b8fc15c186543b23b39d1dd6e0482de')

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
