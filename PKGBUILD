# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-tianshou
_pkg="${pkgname#python-}"
pkgver=2.0.1
pkgrel=2
pkgdesc="An elegant PyTorch deep reinforcement learning library."
arch=('any')
url="https://github.com/thu-ml/tianshou"
license=('MIT')
depends=(
	'python>=3.11'
	'python-cloudpickle'
	'python-deepdiff'
	'python-gymnasium'
	'python-h5py'
	'python-matplotlib'
	'python-numba'
	'python-numpy'
	'python-overrides'
	'python-packaging'
	'python-pandas'
	'python-pettingzoo'
	'python-pytorch'
	'python-sensai-utils'
	'python-tqdm'
	'python-virtualenv'
	'tensorboard')
makedepends=(
	'python-build'
	'python-installer'
	'python-poetry-core'
	'python-wheel')
checkdepends=(
	'python-networkx'
	'python-pytest')
optdepends=(
	'python-arch: rliable-based evaluation'
	'python-docstring-parser: argparse-based experiment configuration'
	'python-jsonargparse: argparse-based experiment configuration'
	'python-joblib: parallel experiment evaluation'
	'python-scipy: rliable-based evaluation'
	'python-opencv: Atari environment wrappers'
	'python-ale-py: Atari environments'
	'python-imageio: MuJoCo rendering'
	'python-mujoco: MuJoCo environments'
	'python-pybullet: PyBullet environments'
	'python-pygame: Box2D and classic-control environments')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c4e26d5d7a388f94bb27fcb4f6e416f64c71375f18d1da7dda73e8ae202b14b')

prepare() {
	cd "$_pkg-$pkgver"
	# This installed runtime helper used pytest only to raise a test failure.
	# Preserve the failure semantics without imposing a pytest runtime dependency.
	sed -i '/^[[:space:]]*import pytest$/d; s/pytest\.fail(status_message)/raise AssertionError(status_message)/' \
		tianshou/utils/determinism.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	local _checkroot="$srcdir/_check" _site
	rm -rf "$_checkroot"
	python -m installer --destdir="$_checkroot" dist/*.whl
	_site=$(python -c 'import site; print(site.getsitepackages()[0])')
	cp -a test "$_checkroot/test"

	cd "$_checkroot"
	# The base suite covers batches, replay buffers, collectors, policies,
	# vector environments, return estimation and serialization without optional
	# simulators or downloaded datasets.
	PYTHONPATH="$_checkroot$_site:$_checkroot" pytest -ra --import-mode=importlib \
		test/base

	PYTHONPATH="$_checkroot$_site" python - <<'PY'
import numpy as np
from tianshou.data import Batch, ReplayBuffer

buffer = ReplayBuffer(size=16)
for step in range(10):
    buffer.add(
        Batch(
            obs=np.array([step, step + 1], dtype=np.float32),
            act=step % 2,
            rew=float(step),
            terminated=step == 9,
            truncated=False,
            obs_next=np.array([step + 1, step + 2], dtype=np.float32),
            info={},
        )
    )
sample, indices = buffer.sample(6)
assert len(buffer) == 10 and len(indices) == 6
assert sample.obs.shape == (6, 2)
assert np.isfinite(sample.rew).all()
print("staged replay-buffer collection and sampling workflow passed")
PY
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
