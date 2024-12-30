# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: fanyujun <dlutfyj@outlook.com>

pkgname=python-lap
epoch=1
pkgver=0.5.12
pkgrel=1
pkgdesc='Linear Assignment Problem solver using Jonker-Volgenant algorithm (LAPJV/LAPMOD)'
arch=(x86_64)
url='https://github.com/gatagat/lap'
license=(BSD-2-Clause)
depends=(python python-numpy)
makedepends=(python-build python-installer python-wheel python-setuptools cython)
checkdepends=(python-scipy python-pytest)
source=("lap-${pkgver}.tar.gz"::"https://github.com/gatagat/lap/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('462186b414ab6bd9239744ae92242e03df9f31f8f2e346ab2c52ff797748ebec')

build() {
  cd "lap-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "lap-${pkgver}"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  # `--pyargs lap` forces pytest to look for tests in the installed package in $PYTHONPATH.
  # Otherwise, it somehow ends up importing lap from $PWD even if `--import-mode importlib`.
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest --pyargs lap
}

package() {
  cd "lap-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
