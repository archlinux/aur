# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-numpyro
_pkgname=numpyro
pkgver=0.22.0
pkgrel=1
pkgdesc="Probabilistic programming with NumPy powered by JAX for autograd and JIT compilation to GPU/TPU/CPU"
arch=('any')
url="https://github.com/pyro-ppl/numpyro"
license=('Apache-2.0')
depends=(
    'python'
    'python-numpy'
    'python-tqdm'
    'python-jax'
    'python-jaxlib'
    'python-multipledispatch'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-scipy'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "jax-batched-triangular-solve.patch")
sha256sums=('13441d320aad3b3a4219a2bb333d491855a1da8bafb4ac50cd9290cb21b66285'
            '2f87d5703bc99b2832ed16763a7f6ead9fc1e62f5feb2dc238e356acd1a31440')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -Np1 -i "$srcdir/jax-batched-triangular-solve.patch"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    local _checkroot="$srcdir/_check" _site
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')

    # Exercise the broad self-contained CPU core. Contrib suites require
    # unpackaged Funsor/TFP/Flax/JAXNS integrations; example tests download
    # datasets. Inference, distributions, transforms and handlers remain here.
    cd "$srcdir"
    JAX_PLATFORMS=cpu XLA_FLAGS=--xla_force_host_platform_device_count=2 \
        PYTHONPATH="$_checkroot$_site" pytest -ra --import-mode=importlib \
        "$_pkgname-$pkgver/test/test_constraints.py" \
        "$_pkgname-$pkgver/test/test_diagnostics.py" \
        "$_pkgname-$pkgver/test/test_distributions_mixture.py" \
        "$_pkgname-$pkgver/test/test_handlers.py" \
        "$_pkgname-$pkgver/test/test_optimizers.py" \
        "$_pkgname-$pkgver/test/test_transforms.py" \
        "$_pkgname-$pkgver/test/infer/test_svi.py"

    JAX_PLATFORMS=cpu PYTHONPATH="$_checkroot$_site" python - <<'PY'
import jax.numpy as jnp
from jax import random
import numpyro
import numpyro.distributions as dist
from numpyro.infer import SVI, Trace_ELBO, autoguide
from numpyro.optim import Adam

x = jnp.linspace(-1.0, 1.0, 30)
y = 1.75 * x - 0.4


def model(x, y=None):
    slope = numpyro.sample("slope", dist.Normal(0, 2))
    intercept = numpyro.sample("intercept", dist.Normal(0, 2))
    with numpyro.plate("observations", x.shape[0]):
        numpyro.sample("y", dist.Normal(slope * x + intercept, 0.05), obs=y)


guide = autoguide.AutoNormal(model)
result = SVI(model, guide, Adam(0.03), Trace_ELBO()).run(
    random.PRNGKey(7), 500, x, y, progress_bar=False
)
median = guide.median(result.params)
assert abs(float(median["slope"]) - 1.75) < 0.15
assert abs(float(median["intercept"]) + 0.4) < 0.15
print("NumPyro CPU variational-inference workflow passed")
PY
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
