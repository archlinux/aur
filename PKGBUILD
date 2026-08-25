# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-libzim
pkgver=3.12.0
pkgrel=1
pkgdesc="Libzim binding for Python: read/write ZIM files in Python"
arch=('x86_64' 'aarch64')
url="https://github.com/openzim/python-libzim"
license=('GPL-3.0-or-later')
depends=(
  'libzim'
  'python'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
optdepends=('python-invoke')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b1f92c3d12043b5ae581ead222feea5dd58637e1ee02c0cec52b6ee9f95f3874')

prepare() {
  cd "$pkgname-$pkgver"

  # Relax dependencies
  sed -i 's/==/>=/g' pyproject.toml
}

build() {
  cd "$pkgname-$pkgver"
  export DONT_DOWNLOAD_LIBZIM=1
  export USE_SYSTEM_LIBZIM=1
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -I -m pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
