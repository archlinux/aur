# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=torchdata
pkgname=python-torchdata
pkgver=0.11.0
pkgrel=1
pkgdesc='A PyTorch repo for data loading and utilities to be shared by the PyTorch domain libraries'
arch=('any')
url='https://github.com/pytorch/data'
license=('BSD-3-Clause')
depends=(
  'python-pytorch'
  'python-requests'
  'python-urllib3'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/data/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('945c53a8587567624aaad2d66204fbae9acb9535696554c53ffeb83320c308b9')

prepare() {
  cd "data-${pkgver}"
  # [build-system].requires lists the PyPI 'cmake'/'ninja' wheels, but the C++/S3
  # extension is OFF by default (pure-Python wheel), so they're never invoked. The
  # system cmake/ninja don't satisfy the *Python* requirement, so
  # `python -m build --no-isolation` aborts "Missing dependencies: cmake, ninja".
  # Drop them from the build requirements.
  python3 - <<'PYEOF'
import re
f="pyproject.toml"; s=open(f).read()
s=re.sub(r'"(cmake|ninja)"\s*,?\s*','',s)
s=re.sub(r',(\s*\])',r'\1',s)
open(f,"w").write(s)
PYEOF
}

build() {
  cd "data-${pkgver}"
  export BUILD_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "data-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
