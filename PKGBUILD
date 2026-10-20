# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-unsloth-zoo
_pkgname=unsloth_zoo
_archive=unsloth-zoo
pkgver=2026.10.7
# Upstream does not tag releases. This is the version-bump commit immediately
# preceding the PyPI upload.
_commit=2086b298d23778a18209b0004e81336660566215
# Match the Unsloth 2026.10.7 source release used as the staged test companion.
_unsloth_commit=7b577a921cc730d584679dd3ac070c12436e3a76
_source="${_archive}-${_commit}"
_unsloth_source="unsloth-${_unsloth_commit}"
pkgrel=1
pkgdesc="Utility functions for Unsloth fine-tuning framework"
arch=('any')
url="https://github.com/unslothai/unsloth-zoo"
license=('LGPL-3.0-or-later')
depends=(
    'python'
    'python-pytorch>=2.4'
    'python-pytorch<2.15'
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
    'trl-import-utils-compat.patch'
    'preserve-installed-triton.patch'
)
sha256sums=('5cd1347f44ec1b331596d27fbbaec405789cbf3004e14afa55299180d238a7d9'
            '504c2246b50f1ebd85bbf425d01a0ff680a844a8f5e092264a6a56b35805e9a2'
            'ddc0c8a0dddae64bdd1f94351b6d86682eae9774fa304a05a84bb6088709ac89'
            'ace48f2fa70e1ac0d88e832587733dd6955eac7a3831a28a1a896f2b60ff62e8')

prepare() {
    cd "$_source"
    # Preserve the real Triton compiler for standalone GPU loss utilities.
    patch -Np1 --fuzz=0 -i "$srcdir/preserve-installed-triton.patch"
    # Use Arch's build backends while preserving the upstream minimums.
    sed -i 's/setuptools==84.0.0/setuptools>=84.0.0/' pyproject.toml
    sed -i 's/setuptools-scm==9.2.0/setuptools-scm>=9.2.0/' pyproject.toml
    # Validate Arch's Transformers 5.19 and Datasets 5 with the retained
    # CPU compatibility suite before widening these upstream ceilings.
    sed -i 's/<=5.17.0/<6/g; s/<5.0.0/<6/g' pyproject.toml

    cd "$srcdir/$_unsloth_source"
    sed -i 's/setuptools==84.0.0/setuptools>=84.0.0/' pyproject.toml
    sed -i 's/setuptools-scm==9.2.2/setuptools-scm>=9.2.2/' pyproject.toml
    patch -Np1 -i "$srcdir/trl-import-utils-compat.patch"
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

    cd "$_source"

    # Representative CPU checks for the changed PEFT, Transformers and TRL
    # interfaces, compiler rewriting and LoRA merging. CUDA execution, MLX
    # and live upstream/PyPI drift probes are outside this packaging check.
    python -m pytest -q --tb=short --disable-socket \
        --basetemp="$pytest_tmp/compat" \
        --allow-hosts=127.0.0.1,localhost,::1 \
        tests/test_upstream_import_fixes_drift.py \
        tests/test_upstream_signatures.py \
        tests/test_compiler_dynamic_exec.py \
        tests/test_unsloth_zoo_lora_merge.py \
        tests/test_peft_paramwrapper_layout_drift.py \
        tests/test_transformers_moe_structure_drift.py \
        tests/test_moe_merge_e2e_cpu.py \
        --deselect tests/test_unsloth_zoo_lora_merge.py::test_active_merge_device_returns_string_on_cuda_host \
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
}
