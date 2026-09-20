# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-cut-cross-entropy
_pkgname=cut_cross_entropy
pkgver=25.9.3
pkgrel=3
pkgdesc="A fast implementation of cross entropy loss using cut method with Triton kernels"
arch=('any')
url="https://github.com/apple/ml-cross-entropy"
license=('LicenseRef-Apple-Sample-Code')
depends=(
    'python'
    'python-packaging'
    'python-pytorch'
    'python-setuptools'
    'python-triton'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
optdepends=(
    'python-nvidia-ml-py: for GPU clock detection when nvidia-smi is unavailable'
    'python-transformers: for Hugging Face Transformers monkey-patching'
)
_archive="ml-cross-entropy"
# Upstream cuts no tags; pin the commit whose cut_cross_entropy.__version__ == pkgver.
_commit=b7a02791b234e187b524fb1dba6a812d521b203a
source=(
    "git+$url.git#commit=$_commit"
    'cce-exact-cpu-test-skip.patch'
)
sha256sums=(
    'SKIP'
    'e2b118aff76eced3e32650c75e2fd38b36549c8527a523c434eae5d1b88c7400'
)

prepare() {
    cd "$_archive"
    # The parameter is named "cce_exact"; upstream's "cce" comparison can
    # never match and runs Ampere-only kernels during its CPU test job.
    patch -Np1 -i "$srcdir/cce-exact-cpu-test-skip.patch"
}

build() {
    cd "$_archive"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive"
    # CUDA/Triton kernel cases carry their own upstream skip marker. The same
    # complete suite also exercises CPU z-loss and distributed/FSDP utilities.
    CUDA_VISIBLE_DEVICES='' PYTHONPATH="$PWD:$PYTHONPATH" pytest -ra

    CUDA_VISIBLE_DEVICES='' PYTHONPATH="$PWD:$PYTHONPATH" python - <<'PY'
import torch
from cut_cross_entropy import linear_cross_entropy

torch.manual_seed(4)
embeddings = torch.randn(2, 3, 5, requires_grad=True)
classifier = torch.randn(7, 5, requires_grad=True)
targets = torch.tensor([[1, 2, 3], [3, 4, 5]])
actual = linear_cross_entropy(
    embeddings, classifier, targets, impl="torch_compile"
)
expected = torch.nn.functional.cross_entropy(
    (embeddings @ classifier.T).flatten(0, 1), targets.flatten()
)
torch.testing.assert_close(actual, expected, rtol=1e-4, atol=1e-5)
actual.backward()
assert embeddings.grad is not None and classifier.grad is not None
print("CPU linear cross-entropy workflow passed")
PY
}

package() {
    cd "$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
