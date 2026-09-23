# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-botorch
_pkg="${pkgname#python-}"
pkgver=0.18.1
pkgrel=1
pkgdesc='Bayesian Optimization in PyTorch'
arch=('any')
url='https://github.com/meta-pytorch/botorch'
license=('MIT')
depends=(
	'google-glog'
	'python'
	'python-gpytorch>=1.15.2'
	'python-linear-operator>=0.6'
	'python-multipledispatch'
	'python-ninja'
	'python-numpy'
	'python-pyre-extensions'
	'python-pytorch>=2.4'
	'python-scipy'
	'python-threadpoolctl'
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
	'python-jax>=0.4.35'
	'python-jax<0.10'
	'python-jaxlib>=0.4.35'
	'python-jaxlib<0.10'
	'python-numpyro>=0.18.0'
	'python-pytest'
	'python-pytest-xdist'
	'python-requests'
)
optdepends=(
	'python-jax>=0.4.35: fully Bayesian (SAAS) models via JAX/NUTS sampling (requires <0.10)'
	'python-jaxlib>=0.4.35: fully Bayesian (SAAS) models via JAX/NUTS sampling (requires <0.10)'
	'python-numpyro>=0.18.0: fully Bayesian (SAAS) models via NUTS sampling'
	'python-pymoo: multi-objective optimization utilities [pymoo]'
)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'scipy-1.18.patch'
	'fused-kernel-large-q.patch'
	'pytorch-2.13.patch'
)
sha256sums=('4c6c322365f09ca98a3a3cb38c3b88b3c920fcd4cb223f30bdd8ec13d526fdd1'
            '66017f5a630dcc248f29cb90d779bdbc799d7af6df668296f82483ae4745df8f'
            '283912c0aa6d14ecb66fd7bee505cbd63f5b41b54496d3ec04f873665b398c84'
            '0ff37ea4c0a782f6ceecf75e370a8b86b98a0ba1d022583a58a4b8716ab556cd')

prepare() {
	cd "$_pkg-$pkgver"
	patch -Np1 -i "$srcdir/scipy-1.18.patch"
	patch -Np1 -i "$srcdir/fused-kernel-large-q.patch"
	patch -Np1 -i "$srcdir/pytorch-2.13.patch"
	# Trial Arch's public linear_operator 0.6 with the retained model,
	# covariance and optimization tests before accepting the relaxed minimum.
	sed -i 's/linear_operator>=0.6.1/linear_operator>=0.6/' pyproject.toml
	# Discover only public namespaces before building; deleting installed files
	# afterwards would leave stale paths in the wheel's RECORD manifest.
	sed -i '/^\[tool.setuptools\]$/a packages.find.include = ["botorch", "botorch.*", "botorch_community", "botorch_community.*"]' pyproject.toml
}

build() {
	cd "$_pkg-$pkgver"
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	local _site
	local _workers=$(( ${SLURM_CPUS_PER_TASK:-4} / 4 ))
	((_workers > 0)) || _workers=1
	((_workers <= 8)) || _workers=8
	_site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
	rm -rf "$srcdir/_check" "$srcdir/_test_support" "$srcdir/_torch_extensions"
	python -m installer --destdir="$srcdir/_check" dist/*.whl
	mkdir -p "$srcdir/_test_support"
	cp -a botorch_community "$srcdir/_test_support/"
	export CUDA_VISIBLE_DEVICES='' JAX_PLATFORMS=cpu
	# XLA otherwise launches one LLVM code-generation shard per allocated CPU,
	# which multiplies peak memory for the fully-Bayesian NUTS tests.
	export XLA_FLAGS='--xla_force_host_platform_device_count=2 --xla_cpu_parallel_codegen_split_count=1 --xla_cpu_multi_thread_eigen=false'
	export OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1
	export MAX_JOBS=2 TORCH_EXTENSIONS_DIR="$srcdir/_torch_extensions"
	# xdist's controller imports warning classes from concurrent workers. Load
	# the library first to avoid Python 3.14 import-lock deadlocks in that driver.
	_run_pytest() {
		python -c 'import botorch; import pytest; raise SystemExit(pytest.main())' "$@"
	}

	# Representative CPU coverage: core GP fitting, optimization, posterior
	# covariance and every interface changed by our compatibility patches.
	# These tests do not use the optional PyMOO backend; keep it in optdepends
	# without pulling its unrelated build/test dependency chain into check().
	# Keep a real multitask NUTS fit in eager mode to bound LLVM memory use;
	# exhaustive model/backend combinations and unavailable PFNs are out of scope.
	cd "$srcdir"
	PYTHONPATH="$srcdir/_check$_site:$srcdir/_test_support" \
		JAX_DISABLE_JIT=1 PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
		_run_pytest -ra -p xdist.plugin -n "$_workers" --dist=loadfile --import-mode=importlib \
		"$srcdir/$_pkg-$pkgver/test/models/test_fully_bayesian_multitask.py::TestFullyBayesianMultiTaskGP::test_fit_model"
	PYTHONPATH="$srcdir/_check$_site:$srcdir/_test_support" \
		PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
		_run_pytest -ra -p xdist.plugin -n "$_workers" --dist=loadfile --import-mode=importlib \
		"$srcdir/$_pkg-$pkgver/test/models/test_gp_regression.py" \
		"$srcdir/$_pkg-$pkgver/test/models/test_pairwise_gp.py" \
		"$srcdir/$_pkg-$pkgver/test/posteriors/test_gpytorch.py" \
		"$srcdir/$_pkg-$pkgver/test/sampling/test_qmc.py" \
		"$srcdir/$_pkg-$pkgver/test/utils/probability/test_lin_ess.py" \
		"$srcdir/$_pkg-$pkgver/test/generation/test_gen.py" \
		"$srcdir/$_pkg-$pkgver/test/optim/test_batched_lbfgs_b.py" \
		"$srcdir/$_pkg-$pkgver/test/acquisition/multi_objective/test_logei.py" \
		"$srcdir/$_pkg-$pkgver/test/acquisition/multi_objective/test_predictive_entropy_search.py"
	PYTHONPATH="$srcdir/_check$_site:$srcdir/_test_support" \
		PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
		_run_pytest -ra -p xdist.plugin -n "$_workers" --dist=loadfile --import-mode=importlib \
		"$srcdir/$_pkg-$pkgver/test_community/utils/test_stat_dist.py"

	PYTHONPATH="$srcdir/_check$_site" python - <<'PY'
from pathlib import Path

import torch
import botorch
from botorch.acquisition.analytic import LogExpectedImprovement
from botorch.fit import fit_gpytorch_mll
from botorch.models import SingleTaskGP
from botorch.optim import optimize_acqf
from gpytorch.mlls import ExactMarginalLogLikelihood

assert "_check" in str(Path(botorch.__file__).resolve())
train_x = torch.linspace(0, 1, 8, dtype=torch.double).unsqueeze(-1)
train_y = -((train_x - 0.7) ** 2)
model = SingleTaskGP(train_x, train_y)
fit_gpytorch_mll(ExactMarginalLogLikelihood(model.likelihood, model))
acquisition = LogExpectedImprovement(model, best_f=train_y.max())
candidate, value = optimize_acqf(
    acquisition,
    bounds=torch.tensor([[0.0], [1.0]], dtype=torch.double),
    q=1,
    num_restarts=5,
    raw_samples=32,
)

assert 0.0 <= candidate.item() <= 1.0
assert abs(candidate.item() - 0.7) < 0.25
assert torch.isfinite(value).all()
PY
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
