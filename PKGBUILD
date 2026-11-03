# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-unsloth-zoo
_pkgname=unsloth_zoo
_archive=unsloth-zoo
pkgver=2026.11.1
# Upstream does not tag releases. This is the version-bump commit immediately
# preceding the PyPI upload.
_commit=f0e92d10c9ab2a02ee9ec3b4a54e2d63582edf1a
# Match the Unsloth 2026.11.1 source release used as the staged test companion.
_unsloth_commit=bbee0dc04fb3c3c8485fc02c0e88da48d2c4dc7b
_source="${_archive}-${_commit}"
_unsloth_source="unsloth-${_unsloth_commit}"
pkgrel=1
pkgdesc="Utility functions for Unsloth fine-tuning framework"
arch=('any')
url="https://github.com/unslothai/unsloth-zoo"
license=('LGPL-3.0-or-later' 'MIT' 'Apache-2.0')
depends=(
    'python'
    'python-pytorch>=2.4'
    'python-pytorch<2.16'
    'python-triton>=3'
    'python-numpy'
    'python-einops'
    'python-packaging>=24.1'
    'python-psutil'
    'python-tqdm'
    'python-protobuf'
    'python-pillow'
    'python-regex'
    'python-typing_extensions'
    'python-filelock'
    'python-sentencepiece>=0.2'
    'python-transformers>=4.52.4'
    'python-transformers<6'
    'python-datasets>=3.4.1'
    'python-datasets<6'
    'python-accelerate>=0.34.1'
    'python-accelerate<2'
    'python-peft>=0.18.0'
    'python-peft<1'
    'python-trl>=0.18.2'
    'python-trl<=1.15.0'
    'python-huggingface-hub>=0.34'
    # Arch's package has epoch 1; retain compatibility with its current 2.x line.
    'python-huggingface-hub<1:3'
    'python-hf-transfer'
    'python-cut-cross-entropy'
    'python-torchao>=0.13'
    'python-tyro'
    'python-msgspec'
    'python-wheel>=0.42'
    # Imported directly by the vision, llama.cpp and model-saving helpers.
    'python-certifi>=2026.10.19'
    'python-requests'
    'python-safetensors'
    'python-torchvision'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
)
checkdepends=(
    'git'
    'ipython'
    'python-bitsandbytes'
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-socket'
    'python-yaml'
)
optdepends=(
    'git: clone llama.cpp for GGUF model conversion'
    'python-bitsandbytes: 4-bit/8-bit quantization and LoRA merging'
    'python-fastapi: diffusion-studio HTTP service'
    'uvicorn: diffusion-studio HTTP service'
)
source=(
    "${_archive}-${_commit}.tar.gz::$url/archive/${_commit}.tar.gz"
    "unsloth-${_unsloth_commit}.tar.gz::https://github.com/unslothai/unsloth/archive/${_unsloth_commit}.tar.gz"
    'preserve-installed-triton.patch'
    'arch-torchvision-pair.patch'
)
sha256sums=('a69ee405fcd5b8a10712a65890a69507212ffbec515058bfd5cf42b03200e5a4'
            '75b1902bcbb06d28111200d10af9ca1d8b1c968c6940d0a8a1263e67d7980792'
            '9cf5a611d5e2490dbd7e77726c8c4115202b675221392676682b8d25388eda69'
            '6f76ab18ae09ee637f89058bedafcf3c031f31e289922e78e23d83af9c3b4fba')

prepare() {
    cd "$_source"
    # Preserve the real Triton compiler for standalone GPU loss utilities.
    patch -Np1 --fuzz=0 -i "$srcdir/preserve-installed-triton.patch"
    # Use Arch's build backends while preserving the upstream minimums.
    sed -i 's/setuptools==84.2.1/setuptools>=84.2.1/' pyproject.toml
    sed -i 's/setuptools-scm==10.3.4/setuptools-scm>=10.3.4/' pyproject.toml
    # Validate Arch's Transformers 5.19 and Datasets 5 with the retained
    # CPU compatibility suite before widening these upstream ceilings.
    sed -i 's/<=5.17.0/<6/g; s/<5.0.0/<6/g' pyproject.toml

    cd "$srcdir/$_unsloth_source"
    sed -i 's/setuptools==84.1.0/setuptools>=84.1.0/' pyproject.toml
    sed -i 's/setuptools-scm==9.2.2/setuptools-scm>=9.2.2/' pyproject.toml
    patch -Np1 --fuzz=0 -i "$srcdir/arch-torchvision-pair.patch"
    # Current Unsloth already coerces TRL availability tuples correctly.
}

build() {
    cd "$_source"
    python -m build --wheel --no-isolation

    # Zoo's import guard requires Unsloth to be discoverable. Build the exact
    # same-release upstream commit as a staged test companion only.
    cd "$srcdir/$_unsloth_source"
    python -m build --wheel --no-isolation
}

check() {
    local test_root="$srcdir/test-install"
    local test_home="$srcdir/test-home"
    local pytest_tmp="$srcdir/pytest-tmp"
    rm -rf "$test_root" "$test_home" "$pytest_tmp"
    mkdir -p "$test_home" "$pytest_tmp"
    python -m installer --destdir="$test_root" "$srcdir/$_source"/dist/*.whl
    python -m installer --destdir="$test_root" "$srcdir/$_unsloth_source"/dist/*.whl
    local site_packages
    site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    local staged="$test_root$site_packages"

    export CUDA_VISIBLE_DEVICES=
    export ROCR_VISIBLE_DEVICES=
    export HIP_VISIBLE_DEVICES=
    export HF_HUB_OFFLINE=1
    export TRANSFORMERS_OFFLINE=1
    export HF_DATASETS_OFFLINE=1
    export UNSLOTH_COMPILE_DISABLE=1
    export UNSLOTH_IS_PRESENT=1
    export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
    export XDG_CACHE_HOME="$test_home/cache"
    export PYTHONPATH="$staged"

    # Collect copied upstream tests outside the checkout so Python loads the
    # installed wheels. The upstream CPU harness remains unchanged.
    rm -rf "$srcdir/test-run"
    mkdir -p "$srcdir/test-run"
    cp -a "$srcdir/$_source/tests" "$srcdir/test-run/"
    cd "$srcdir/test-run"

    # Representative CPU checks for the changed PEFT, Transformers and TRL
    # interfaces, compiler rewriting and LoRA merging. CUDA execution, MLX
    # and live upstream/PyPI drift probes are outside this packaging check.
    python -P -m pytest -q --tb=short --disable-socket \
        --basetemp="$pytest_tmp/compat" \
        --allow-hosts=127.0.0.1,localhost,::1 \
        tests/test_upstream_import_fixes_drift.py \
        tests/test_upstream_signatures.py \
        tests/test_compiler_dynamic_exec.py \
        tests/test_unsloth_zoo_lora_merge.py \
        tests/test_peft_paramwrapper_layout_drift.py \
        tests/test_transformers_moe_structure_drift.py \
        tests/test_moe_merge_e2e_cpu.py \
        tests/test_torch215_inductor_workarounds.py \
        --deselect tests/test_unsloth_zoo_lora_merge.py::test_active_merge_device_returns_string_on_gpu \
        --deselect tests/test_unsloth_zoo_lora_merge.py::test_merge_lora_moves_cpu_inputs_to_active_device

    # Exercise the installed wheel, not the checkout.
    cd "$srcdir"
    PKGVER="$pkgver" TEST_ROOT="$test_root" \
        UNSLOTH_ZOO_DISABLE_GPU_INIT=1 python - <<'PY'
from importlib.metadata import version
from pathlib import Path
import os

import unsloth_zoo
from PIL import Image
from unsloth_zoo.utils import Version
from unsloth_zoo.vision_utils import process_vision_info

assert version("unsloth-zoo") == unsloth_zoo.__version__ == os.environ["PKGVER"]
assert Path(unsloth_zoo.__file__).resolve().is_relative_to(
    Path(os.environ["TEST_ROOT"]).resolve()
)
assert Version("5.12.1") > Version("5.5.0")

# Reproduce the local-image preprocessing step used by multimodal fine-tuning.
conversation = [{
    "role": "user",
    "content": [{
        "type": "image",
        "image": Image.new("RGB", (113, 85), color=(12, 34, 56)),
    }],
}]
images, videos = process_vision_info(conversation)
assert videos is None and len(images) == 1
assert images[0].mode == "RGB" and images[0].size == (112, 84)
assert images[0].getpixel((56, 42)) == (12, 34, 56)
PY
}

package() {
    cd "$_source"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Preserve original notices for the source-vendored FLA and vLLM kernels.
    install -Dm644 unsloth_zoo/_vendored/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    for component in fla vllm; do
        install -Dm644 "unsloth_zoo/_vendored/$component/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/$component-LICENSE"
        install -Dm644 "unsloth_zoo/_vendored/$component/MANIFEST" \
            "$pkgdir/usr/share/licenses/$pkgname/$component-MANIFEST"
    done
}
