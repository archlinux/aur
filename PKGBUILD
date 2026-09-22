# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gpytorch
_pkgname=${pkgname#python-}
pkgver=1.15.2
pkgrel=2
pkgdesc='A highly efficient implementation of Gaussian Processes in PyTorch'
arch=('any')
url='https://github.com/cornellius-gp/gpytorch'
license=('MIT')
depends=('python-scikit-learn' 'python-linear-operator' 'python-pytorch' 'python-scipy' 'python-mpmath')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm' 'git')
checkdepends=('python-pytest')
optdepends=(
            'ipython: for [examples] module'
            'jupyter-notebook: for [examples] module'
            'python-matplotlib: for [examples] module'
            'python-torchvision: for [examples] module'
            'python-tqdm: for [examples] module'
            'python-pyro-ppl: for [pyro] module'
            'python-pykeops: for [keops] module'
           )
# gpytorch's build resolves its version with setuptools-scm (write_to=
# gpytorch/version.py), so a release tarball (no .git, no version.py) builds as
# version "Unknown". Use a git checkout pinned to the tag so scm reports 1.15.2.
source=("git+https://github.com/cornellius-gp/gpytorch.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"

  local _site _check_root _test_root
  _site=$(python -c 'import site; print(site.getsitepackages()[0])')
  _check_root="$srcdir/_check"
  _test_root="$srcdir/_tests"
  rm -rf "$_check_root" "$_test_root"
  python -m installer --destdir="$_check_root" dist/*.whl
  mkdir -p "$_test_root"
  cp -a test "$_test_root/test"

  # Run the complete self-contained CPU suite against the built wheel. KeOps
  # and Pyro are optional integrations with separate dependency stacks.
  cd "$_test_root"
  CUDA_VISIBLE_DEVICES='' OMP_NUM_THREADS=1 \
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
    PYTHONPATH="$_check_root$_site" \
    python -P -m pytest -ra --import-mode=importlib test \
      --ignore=test/kernels/keops \
      --ignore=test/examples/test_keops_gp_regression.py \
      --ignore=test/examples/test_pyro_integration.py

  # Representative exact-GP regression: train a model, perform posterior
  # inference and verify that optimization improved the marginal likelihood.
  CUDA_VISIBLE_DEVICES='' OMP_NUM_THREADS=1 \
    PYTHONPATH="$_check_root$_site" python -P - <<'PY'
import math

import gpytorch
import torch

torch.manual_seed(7)
train_x = torch.linspace(0, 1, 24)
train_y = torch.sin(train_x * (2 * math.pi))


class ExactModel(gpytorch.models.ExactGP):
    def __init__(self, x, y, likelihood):
        super().__init__(x, y, likelihood)
        self.mean_module = gpytorch.means.ConstantMean()
        self.covar_module = gpytorch.kernels.ScaleKernel(gpytorch.kernels.RBFKernel())

    def forward(self, x):
        return gpytorch.distributions.MultivariateNormal(
            self.mean_module(x), self.covar_module(x)
        )


likelihood = gpytorch.likelihoods.GaussianLikelihood()
model = ExactModel(train_x, train_y, likelihood)
model.train()
likelihood.train()
optimizer = torch.optim.Adam(model.parameters(), lr=0.12)
mll = gpytorch.mlls.ExactMarginalLogLikelihood(likelihood, model)
losses = []
for _ in range(25):
    optimizer.zero_grad()
    loss = -mll(model(train_x), train_y)
    loss.backward()
    optimizer.step()
    losses.append(loss.item())

model.eval()
likelihood.eval()
test_x = torch.linspace(0, 1, 11)
with torch.no_grad(), gpytorch.settings.fast_pred_var():
    prediction = likelihood(model(test_x))
expected = torch.sin(test_x * (2 * math.pi))
assert losses[-1] < losses[0]
assert prediction.mean.shape == test_x.shape
assert torch.isfinite(prediction.mean).all()
assert torch.mean(torch.abs(prediction.mean - expected)).item() < 0.35
PY
}

package() {
  cd "$_pkgname"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
