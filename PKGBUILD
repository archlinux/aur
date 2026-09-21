# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=torchdata
pkgname=python-torchdata
pkgver=0.11.0
pkgrel=2
pkgdesc='A PyTorch repo for data loading and utilities to be shared by the PyTorch domain libraries'
arch=('any')
url='https://github.com/pytorch/data'
license=('BSD-3-Clause')
depends=(
  'python'
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
checkdepends=(
  'python-datasets'
  'python-expecttest'
  'python-numpy'
  'python-parameterized'
  'python-psutil'
  'python-pytest'
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/pytorch/data/archive/refs/tags/v${pkgver}.tar.gz"
  'python-3.14-multiprocessing-tests.patch'
)
sha256sums=(
  '945c53a8587567624aaad2d66204fbae9acb9535696554c53ffeb83320c308b9'
  '25cfdeae51f003c5bbe137eb6aa56d35b93b81578c9813252efdedd120db3429'
)

prepare() {
  cd "data-${pkgver}"
  # Python 3.14 changed the POSIX multiprocessing default from fork to
  # forkserver. Keep upstream's worker tests on their intended spawn context
  # and make the affinity initializer serializable under the new default.
  patch -Np1 -i "$srcdir/python-3.14-multiprocessing-tests.patch"
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

check() {
  cd "data-${pkgver}"

  local _check="${srcdir}/_check"
  local _site
  rm -rf "${_check}" "${srcdir}/_tests"
  python -m installer --destdir="${_check}" dist/*.whl
  _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  cp -a test "${srcdir}/_tests"

  cd "${srcdir}/_tests"
  # Run the complete upstream suite against the wheel. CUDA cases use
  # upstream's own TEST_CUDA skips on this CPU-only builder.
  # The multiprocessing tests retain enough file descriptors across the full
  # suite to exceed the cluster's 1024-descriptor soft limit.
  ulimit -n 65536
  PYTHONPATH="${_check}${_site}" pytest -v -ra .

  # Exercise a checkpointable node graph and prove that restoring Loader state
  # resumes at the exact next batch instead of replaying consumed samples.
  PYTHONPATH="${_check}${_site}" python - <<'PY'
from torchdata.nodes import Batcher, IterableWrapper, Loader, Mapper

graph = Batcher(Mapper(IterableWrapper(range(10)), lambda value: value * value), batch_size=3)
loader = Loader(graph)
iterator = iter(loader)
assert next(iterator) == [0, 1, 4]
state = loader.state_dict()
assert next(iterator) == [9, 16, 25]

loader.load_state_dict(state)
assert next(iter(loader)) == [9, 16, 25]
PY
}

package() {
  cd "data-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
