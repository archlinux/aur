# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=gym-pusht
_module=gym_pusht
pkgname=python-gym-pusht
pkgver=0.1.8
pkgrel=1
pkgdesc="A gymnasium environment for PushT"
arch=('any')
url="https://github.com/huggingface/gym-pusht"
license=('Apache-2.0')
depends=(
    'python'
    'python-gymnasium'
    'python-opencv'
    'python-pygame'
    'python-pymunk'
    'python-shapely'
    'python-scikit-image'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-poetry-core'
)
checkdepends=(
    'python-pytest'
)
optdepends=(
    'python-pre-commit: for the dev extra'
    'python-debugpy: for the dev extra'
    'python-pytest: for the test extra'
    'python-pytest-cov: for the test extra'
)
_commit=e49cf07fd32ad6e69443af2921dd8343b0f9ad7d
_archive="gym-pusht-$_commit"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('41c35e99a8673ee12407840e4e89f2916a91805bcfc65a6245fd721625eca138')

prepare() {
    cd "$srcdir/$_archive"
    # pymunk 7 (the version Arch ships) removed Space.add_collision_handler(); the
    # PushT env raises AttributeError on reset() without this. Port the one call
    # site to the equivalent on_collision() (same (arbiter, space, data) callback
    # signature), so the env actually runs.
    sed -i 's/self\.collision_handeler = self\.space\.add_collision_handler(0, 0)/self.space.on_collision(0, 0, post_solve=self._handle_collision)/' gym_pusht/envs/pusht.py
    sed -i '/self\.collision_handeler\.post_solve = self\._handle_collision/d' gym_pusht/envs/pusht.py
    # NumPy 2.4 removed the deprecated row_stack alias; vstack is identical.
    sed -i 's/np\.row_stack(/np.vstack(/g' gym_pusht/envs/pusht.py
}

build() {
    cd "$srcdir/$_archive"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_archive"
    local _checkroot="$srcdir/_check" _site
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')
    cp -a tests "$_checkroot/tests"

    cd "$_checkroot"
    SDL_VIDEODRIVER=dummy PYTHONPATH="$_checkroot$_site" \
        pytest -ra --import-mode=importlib tests

    SDL_VIDEODRIVER=dummy PYTHONPATH="$_checkroot$_site" python - <<'PY'
import numpy as np
import gymnasium as gym
import gym_pusht  # noqa: F401

env = gym.make("gym_pusht/PushT-v0", obs_type="state")
first, _ = env.reset(seed=17)
second, _ = env.reset(seed=17)
np.testing.assert_allclose(first, second)
total_reward = 0.0
for _ in range(25):
    observation, reward, terminated, truncated, _ = env.step(
        np.array([300.0, 250.0], dtype=np.float32)
    )
    assert observation.shape == (5,)
    assert np.isfinite(observation).all() and np.isfinite(reward)
    total_reward += float(reward)
    if terminated or truncated:
        break
env.close()
assert np.isfinite(total_reward)
print("staged deterministic PushT rollout workflow passed")
PY
}

package() {
    cd "$srcdir/$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
