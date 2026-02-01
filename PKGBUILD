# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: envolution
# Contributor: rumpelsepp <stefan at rumpelsepp dot org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
pkgname=python-msgspec
_name=${pkgname#python-}
pkgver=0.20.0
pkgrel=1
pkgdesc="A fast and friendly JSON/MessagePack library, with optional schema validation"
arch=('x86_64' 'aarch64')
url="https://github.com/jcrist/msgspec"
license=('BSD-3-Clause')
depends=(
  'glibc'
  'python'
  'python-attrs'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-msgpack'
  'python-pytest'
)
optdepends=(
  'python-tomli-w: for writing TOML'
  'python-yaml: for YAML support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jcrist/msgspec/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fd1f5aa07501516720bfaa3f7cbcb7170a0b944d3f49ee107caf0fa56d056d9c')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0].replace('/usr/', ''))")
  export PYTHONPATH="test-env/${site_packages}"
  test-env/bin/python -m installer dist/*.whl

  # Run only unit tests
  test-env/bin/python -m pytest tests/unit
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
