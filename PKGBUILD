# Maintainer: rnbguy

pkgname=python-timestral-git
pkgver=r1.a534bdb
pkgrel=1
pkgdesc='Standalone inference for Mistral AI Timestral time-series forecasting models'
arch=('any')
url='https://github.com/mistralai/timestral'
license=('Apache-2.0')
depends=(
  'python'
  'python-huggingface-hub>=0.23'
  'python-numpy>=1.24'
  'python-pytorch>=2.4'
  'python-safetensors>=0.4'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=77'
  'python-wheel'
)
checkdepends=('python-pytest')
provides=('python-timestral')
conflicts=('python-timestral')
source=('timestral::git+https://github.com/mistralai/timestral.git#branch=main')
sha256sums=('SKIP')

# Upstream has no tags; use the commit count and hash for the version.
pkgver() {
  cd timestral
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd timestral
  python -m build --wheel --no-isolation
}

check() {
  cd timestral
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd timestral
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
