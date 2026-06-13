# Maintainer: LwhJesse <lwhjesse@gmail.com>

pkgname=python-pymoo
_name=pymoo
pkgver=0.6.1.6
pkgrel=1
pkgdesc="Multi-Objective Optimization in Python"
arch=('x86_64')
url="https://pymoo.org"
license=('Apache-2.0')
depends=(
  'python'
  'python-numpy'
  'python-scipy'
  'python-moocore'
  'python-autograd'
  'python-cma'
  'python-matplotlib'
  'python-alive-progress'
  'python-deprecated'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'cython'
  'python-numpy'
)
source=("https://files.pythonhosted.org/packages/source/p/pymoo/pymoo-${pkgver}.tar.gz")
sha256sums=('d48077c7b612b149e7db5351459bf96a0950e84ebcd5b7b953bf46b3dcf1ac28')

prepare() {
  cd "${_name}-${pkgver}"
  python - <<'PYFIX'
from pathlib import Path
p = Path("setup.py")
s = p.read_text()
s = s.replace('ext_modules=Cython.Build.cythonize("pymoo/functions/compiled/*.pyx", force=True),', 'ext_modules=[],')
p.write_text(s)
PYFIX
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
