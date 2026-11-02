# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-monotonic-align
pkgver=1.2
pkgrel=1
pkgdesc='Cython monotonic alignment search with PyTorch tensor interfaces'
arch=('x86_64')
url='https://github.com/resemble-ai/monotonic_align'
license=('MIT')
depends=('python' 'python-numpy' 'python-pytorch' 'glibc')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
options=('!strip')
_commit=c6e5e6cb19882164027eb6e35118e841eed9298e
source=("monotonic_align-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
        'check_alignment.py')
sha256sums=('c8b43fb1dffa08da65b9d45901e020139ec579234e249872b7f3b77dc801277a'
            '7f4abb6ee75d2875ed93b8d69f889d3ec4824479d0b75e5c5a41ec6997fc3bb7')

build() {
  cd "monotonic_align-${_commit}"
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/test-env"
  "$srcdir/test-env/bin/python" -m installer "monotonic_align-${_commit}"/dist/*.whl
  "$srcdir/test-env/bin/python" -I - "$srcdir/monotonic_align-${_commit}/tests/test_max_path.py" <<'PY'
import pathlib, runpy, sys, torch
import monotonic_align
assert pathlib.Path(monotonic_align.__file__).is_relative_to(sys.prefix)
torch.manual_seed(0)
runpy.run_path(sys.argv[1], run_name='__main__')
print('PASS: unchanged upstream examples using the installed wheel')
PY
  "$srcdir/test-env/bin/python" -I "$srcdir/check_alignment.py"
}

package() {
  cd "monotonic_align-${_commit}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
