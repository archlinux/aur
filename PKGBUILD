# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lerobot
_pkgname=lerobot
pkgver=0.5.1
pkgrel=1
pkgdesc="State-of-the-art Machine Learning for Real-World Robotics"
arch=('any')
url="https://github.com/huggingface/lerobot"
license=('Apache-2.0')
depends=(
    'python'
    'python-datasets'
    'python-diffusers'
    'python-huggingface-hub'
    'python-accelerate'
    'python-numpy'
    'python-setuptools'
    'cmake'
    'python-einops'
    'python-opencv'
    'python-av'
    'python-jsonlines'
    'python-packaging'
    'python-pynput'
    'python-pyserial'
    'python-wandb'
    'python-pytorch'
    'python-torchcodec'
    'python-torchvision'
    'python-draccus'
    'python-gymnasium'
    'python-deepdiff'
    'python-imageio'
    'python-termcolor'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'python-rerun-sdk: for real-time visualization during teleoperation and recording'
    'python-pynput: for gamepad support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/huggingface/lerobot/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('45f8276b0990472f4a4f62428a74a0fb1040aefda2a8798ab5aa9e1ee3ddba96')

prepare() {
    cd "$_pkgname-$pkgver"

    # Remove rerun-sdk from hard dependencies (only needed for visualization)
    sed -i '/rerun-sdk/d' pyproject.toml

    # Drop the [hf-transfer,cli] extras if present and use plain huggingface-hub
    sed -i 's/huggingface-hub\[[^]]*\]/huggingface-hub/' pyproject.toml

    # Relax the exact draccus pin for the Arch rolling release
    sed -i 's/draccus==0.10.0/draccus>=0.10.0/' pyproject.toml

    # Strip upper version bounds (",<X.Y.Z") on dependency specifiers so the
    # package works against Arch's newer rolling-release dependency versions
    sed -i -E 's/(>=[0-9][0-9.]*),<[0-9][0-9.]*/\1/g' pyproject.toml
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    rm -rf "$srcdir/test-install"
    python -m installer --destdir="$srcdir/test-install" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$srcdir/test-install$site_packages:$PYTHONPATH" python -c "
import lerobot
print(f'lerobot {lerobot.__version__} imported successfully')
print(f'Available policies: {len(lerobot.available_policies)}')
"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
