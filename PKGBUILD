# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lerobot
_pkgname=lerobot
pkgver=0.6.1
pkgrel=1
_commit=7e241bd630a3719a56157a497ce5d08f244784f1
pkgdesc="State-of-the-art machine learning for real-world robotics"
arch=('any')
url="https://github.com/huggingface/lerobot"
license=('Apache-2.0')
depends=(
    'cmake>=3.29.0.1'
    'python>=3.12'
    'python-draccus>=0.11.6'
    'python-einops>=0.8.0'
    'python-gymnasium>=1.1.1'
    'python-huggingface-hub>=1:1.6.0'
    'python-numpy>=2.0.0'
    'python-opencv>=4.9.0'
    'python-packaging>=24.2'
    'python-pillow>=10.0.0'
    'python-pytorch>=2.7'
    'python-requests>=2.32.0'
    'python-safetensors>=0.4.3'
    'python-setuptools>=71.0.0'
    'python-termcolor>=2.4.0'
    'python-torchvision>=0.22.0'
    'python-tqdm>=4.66.0'
    'python-yaml'
)
makedepends=(
    'git'
    'git-lfs'
    'python-build'
    'python-installer'
    'python-wheel'
)
checkdepends=(
    'python-pandas'
    'python-pyarrow'
    'python-pytest'
    'python-pytest-timeout'
)
# Optional integrations retain upstream's own compatibility requirements.
# The package check below exercises the core CPU data-processing interfaces.
optdepends=(
    'ffmpeg: video encoding and dataset conversion'
    'python-accelerate: distributed policy training'
    'python-av: dataset video decoding'
    'python-can: Damiao and RobStride motor buses'
    'python-datasets: Hugging Face dataset integration'
    'python-deepdiff: dataset metadata comparisons'
    'python-diffusers: diffusion, Groot, and multi-task policies'
    'python-fsspec: dataset video filesystems'
    'python-grpcio: asynchronous inference'
    'python-hidapi: gamepad teleoperation'
    'python-httpx: remote Hugging Face training jobs'
    'python-imageio: simulation video output'
    'python-jsonlines: dataset JSON Lines support'
    'python-matplotlib: plots and asynchronous inference visualization'
    'python-num2words: SmolVLA policy'
    'python-onnx: Unitree G1 model interchange'
    'python-onnxruntime: Unitree G1 inference'
    'python-openai: annotation pipeline'
    'python-pandas: dataset and annotation processing'
    'python-peft: parameter-efficient policy fine-tuning'
    'python-protobuf: asynchronous inference protocol'
    'python-pyarrow: dataset storage'
    'python-pygame: gamepad and HopeJR teleoperation'
    'python-pynput: keyboard teleoperation'
    'python-pydantic: SARM reward model configuration'
    'python-pyserial: serial hardware controllers'
    'python-pyzmq: LeKiwi, Unitree, and asynchronous transport'
    'python-scipy: scientific policy and simulation routines'
    'python-timm: Groot vision models'
    'python-torchcodec: TorchCodec dataset video decoding'
    'python-torchdiffeq: WallX policy'
    'python-transformers: transformer-based policies and tokenizers'
    'python-wandb: experiment tracking during training'
)
source=(
    "$pkgname::git+$url.git#tag=v$pkgver"
    'arch-rolling-dependencies.patch'
)
sha256sums=(
    'SKIP'
    '4141b0ffb9d597d931c41c226285c44e31eb6e5df8bf4253b33beb2a1f6e10ea'
)

prepare() {
    cd "$pkgname"

    [[ "$(git rev-parse HEAD)" == "$_commit" ]]

    # GitHub tag archives contain LFS pointer files. Fetch the exact objects
    # referenced by v$pkgver so the complete upstream fixture suite can run.
    git lfs install --local
    git remote remove lfs-upstream 2>/dev/null || true
    git remote add lfs-upstream "$url.git"
    git lfs pull lfs-upstream --include='tests/artifacts/**' --exclude=''
    git lfs checkout
    while IFS= read -r lfs_file; do
        if head -n 1 "$lfs_file" | grep -qx \
            'version https://git-lfs.github.com/spec/v1'; then
            printf 'Unresolved Git LFS fixture: %s\n' "$lfs_file" >&2
            return 1
        fi
    done < <(git lfs ls-files -n)

    # Arch moves faster than the conservative upstream dependency matrix.
    # Keep every still-valid cap and relax only versions covered by check().
    git apply --check ../arch-rolling-dependencies.patch
    git apply --whitespace=nowarn ../arch-rolling-dependencies.patch
    # Upstream 0.6.1 includes the Draccus choice-discriminator fix.
}

build() {
    cd "$pkgname"
    rm -rf build dist
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"

    local site_packages
    site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    rm -rf "$srcdir/lerobot-check" "$srcdir/lerobot-test-suite" \
        "$srcdir/lerobot-hf-home" "$srcdir/lerobot-pytest-tmp"
    python -m installer --destdir="$srcdir/lerobot-check" dist/*.whl
    mkdir -p "$srcdir/lerobot-test-suite"
    cp -a tests "$srcdir/lerobot-test-suite/tests"
    # A small RTC test group deliberately loads policy modules by file path
    # from the source layout.  Keep that fixture tree beside the copied tests;
    # normal imports still resolve to the installed wheel through PYTHONPATH.
    cp -a src "$srcdir/lerobot-test-suite/src"

    cd "$srcdir/lerobot-test-suite"
    # These four nodes explicitly fetch the lerobot/cartpole-env repository
    # from Hugging Face. All local environment-construction tests still run.
    CUDA_VISIBLE_DEVICES='' \
    HF_HOME="$srcdir/lerobot-hf-home" \
    HF_HUB_OFFLINE=1 \
    LEROBOT_TEST_DEVICE='cpu' \
    PYTHONPATH="$srcdir/lerobot-check$site_packages" \
        python -m pytest tests -vv --maxfail=10 --timeout=300 \
            --basetemp="$srcdir/lerobot-pytest-tmp" \
            --deselect='tests/envs/test_envs.py::test_make_env_from_hub_with_trust[lerobot/cartpole-env]' \
            --deselect='tests/envs/test_envs.py::test_make_env_from_hub_with_trust[lerobot/cartpole-env@main]' \
            --deselect='tests/envs/test_envs.py::test_make_env_from_hub_with_trust[lerobot/cartpole-env:env.py]' \
            --deselect=tests/envs/test_envs.py::test_make_env_from_hub_async
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
