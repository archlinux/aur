# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: pjvm <pjvm742@disroot.org>

pkgname=python-pettingzoo
_name=${pkgname#python-}
pkgver=1.27.0
pkgrel=1
pkgdesc="Gymnasium for multi-agent reinforcement learning"
arch=('any')
url="https://pettingzoo.farama.org/"
license=('MIT')
depends=('python'
         'python-numpy>=1.21.0'
         'python-gymnasium>=1.0.0'
         'python-farama-notifications'
         'python-typing_extensions>=4.4.0'
         # The official Arch python-pygame package provides the same pygame
         # import/API used by upstream and satisfies the >=2.3 runtime bound.
         'python-pygame>=2.3.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
optdepends=('python-pybox2d>=2.3.5: required for the SISL environments'
            'python-scipy>=1.4.1: required for the SISL environments'
            'python-pymunk>=6.2.0: required for the SISL and butterfly environments'
            'python-pillow>=8.0.1: required for some environments'
            'python-chess>=1.9.4: required for the chess environment'
            'python-rlcard>=1.0.5: required for the card game (classic) environments'
            'python-shimmy>=1.2.0: required for the OpenSpiel classic environments'
            'python-pytest>=8.0.0: required for the packaged environment API test helpers')
_archive="PettingZoo-$pkgver"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Farama-Foundation/PettingZoo/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('da691c5a4416c6a1664fa7f9c38babb6371923df14451e0bb05538cea55f88aa')

build() {
    cd "$srcdir/$_archive"
    python -m build --wheel --no-isolation
}

check() {
    rm -rf "$srcdir/test-install"
    cd "$srcdir/$_archive"
    python -m installer --destdir="$srcdir/test-install" dist/*.whl
    local site_packages
    site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    local staged="$srcdir/test-install$site_packages"

    # The Atari, RLCard and OpenSpiel matrix cannot be collected without
    # multi-agent-ale-py, RLCard and Farama Shimmy, none of which currently has
    # an Arch/AUR source-package provider. pytest-markdown-docs also has no
    # provider; the repository-level conftest only defines that plugin's hook
    # and imports the unavailable extras. Run the complete upstream core/API
    # subset that uses the base dependency closure, plus the bundled pygame
    # environment unit tests, without loading that unrelated conftest.
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
        SDL_VIDEODRIVER=dummy SDL_AUDIODRIVER=dummy \
        PYTHONPATH="$staged:$PWD${PYTHONPATH:+:$PYTHONPATH}" \
        python -m pytest -c /dev/null --noconftest -p no:cacheprovider -v \
        pettingzoo/butterfly/cooperative_pong/test_ball.py \
        pettingzoo/classic/tictactoe/test_board.py \
        test/action_mask_test.py \
        test/doc_examples_test.py \
        test/print_test.py \
        test/test_registry.py \
        test/variable_env_test.py

    # Exercise a regular installed-package workflow: render and play a complete
    # deterministic Tic-Tac-Toe game, then verify its board and rewards.
    SDL_VIDEODRIVER=dummy SDL_AUDIODRIVER=dummy \
        PYTHONPATH="$staged${PYTHONPATH:+:$PYTHONPATH}" python - <<'PY'
from pettingzoo.classic import tictactoe_v3

game = tictactoe_v3.env(render_mode="rgb_array", screen_height=90)
game.reset(seed=7)
frame = game.render()
assert frame.shape == (90, 90, 3)
for move in (0, 3, 1, 4, 2):
    observation, reward, terminated, truncated, info = game.last()
    assert not terminated and not truncated
    assert observation["action_mask"][move] == 1
    game.step(move)
assert game.unwrapped.board.squares == [1, 1, 1, 2, 2, 0, 0, 0, 0]
assert game.rewards == {"player_1": 1, "player_2": -1}
assert all(game.terminations.values())
game.close()
PY
}

package() {
    cd "$srcdir/$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
