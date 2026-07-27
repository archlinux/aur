# Maintainer: aur.chaotic.cx
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

_pkgname="pyinfra"
pkgname="$_pkgname"
pkgver=3.10.0
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
sha256sums=('5d55f9a7a0974d8324641d23a80ddda4b66b0feb2fc80c6936149d5cb672b4d9')

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
