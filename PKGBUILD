# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: rumpelsepp <stefan at rumpelsepp dot org>

pkgname=python-msgspec
_pkgname=${pkgname#python-}
pkgver=0.18.6
_commit=9ed5e0d4f6e47e6f520835605bb647f234e7f6f3
pkgrel=3
pkgdesc="A fast and friendly JSON/MessagePack library, with optional schema validation"
arch=(x86_64)
url="https://github.com/jcrist/msgspec"
license=(BSD-3-Clause)
depends=(
  glibc
  python
  python-attrs
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-msgpack
  python-pytest
)
optdepends=(
  'python-tomli-w: for TOML support'
  'python-tomli: for TOML support'
  'python-yaml: for YAML support'
)
source=("git+$url.git#commit=$_commit")
sha256sums=('89d22370c834872112030e7cc84f2aaad1525ad72db43f6d2dbdb316f1a1d3cb')

pkgver() {
  cd "$_pkgname"

  git describe --tags
}

build() {
  cd "$_pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest tests/
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
