# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-peft
_pkgname=${pkgname#python-}
pkgver=0.21.2
pkgrel=1
pkgdesc='State-of-the-art Parameter-Efficient Fine-Tuning.'
arch=('any')
url='https://github.com/huggingface/peft'
license=('Apache-2.0')
groups=('huggingface')
depends=(
    'python-accelerate'
    'python-attrs'
    'python-huggingface-hub'
    'python-numpy'
    'python-packaging'
    'python-psutil'
    'python-pytorch'
    'python-safetensors'
    'python-tqdm'
    'python-transformers'
    'python-typing_extensions'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=(
    'python-datasets'
    'python-diffusers'
    'python-parameterized'
    'python-protobuf'
    'python-pytest'
    'python-pytest-cov'
    'python-pytest-xdist'
    'python-scikit-learn'
    'python-scipy'
    'python-sentencepiece'
    'python-torchvision'
)
optdepends=(
    'python-aqlm: AQLM quantized adapters'
    'python-bitsandbytes: bitsandbytes quantized adapters and optimizers'
    'python-deepspeed: DeepSpeed checkpointing and training'
    'python-diffusers: diffusion-model adapters'
    'python-neural-compressor: Intel neural-compressor quantized adapters'
    'python-scikit-learn: EVA initialization'
    'python-scipy: EVA initialization'
    'python-torchao: torchao quantized adapters'
    'python-transformer-engine: Transformer Engine layers'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/huggingface/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('61b46a4a3c13b2deaa0f53dfd8a6050fd61c37901a4bb1f9907228f97e1143a8')

build() {
    python -m build -nw $_pkgname-$pkgver
}

check() {
    cd "$_pkgname-$pkgver"
    # Keep the suite deterministic and CPU-only. The omitted config cases and
    # eight custom-model cases unconditionally fetch fixtures from the Hub;
    # everything else below constructs its models and checkpoints locally.
    CUDA_VISIBLE_DEVICES='' HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 \
        PYTHONPATH="$PWD/src:$PYTHONPATH" pytest --no-cov -ra \
        tests/test_config.py \
        -k 'not test_from_pretrained and not test_save_pretrained_with_runtime_config'

    # test_pvera_reproducible fetches tiny-random-OPT weights from the Hub;
    # exclude that network fixture from the offline suite. Other PVeRA tests run.
    CUDA_VISIBLE_DEVICES='' HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 \
        PYTHONPATH="$PWD/src:$PYTHONPATH" pytest --no-cov -ra \
        --deselect=tests/test_custom_models.py::TestPeftCustomModel::test_pvera_reproducible \
        --deselect=tests/test_custom_models.py::TestPeftCustomModel::test_multiple_adapters_automatic_modules_to_save \
        --deselect=tests/test_custom_models.py::TestPeftCustomModel::test_multiple_adapters_seq_cls_mixed_modules_to_save_merging_adapters \
        --deselect=tests/test_custom_models.py::TestPeftCustomModel::test_gpt2_dora_merge_and_unload \
        --deselect=tests/test_custom_models.py::TestPeftCustomModel::test_gpt2_dora_merge_and_unload_safe_merge \
        --deselect=tests/test_custom_models.py::TestPeftCustomModel::test_dora_save_and_load_remapping \
        --deselect=tests/test_custom_models.py::TestDynamicDispatch::test_override_lora_linear \
        --deselect=tests/test_custom_models.py::TestPeftCustomModel::test_delete_adapter_multiple_adapters_with_trainable_token_indices \
        --deselect=tests/test_custom_models.py::TestPeftCustomModel::test_multiple_adapters_no_needless_copy_modules_to_save \
        tests/test_custom_models.py

    CUDA_VISIBLE_DEVICES='' HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 \
        PYTHONPATH="$PWD/src:$PYTHONPATH" pytest --no-cov -ra \
        tests/test_adamss_asa.py \
        tests/test_bufferdict.py \
        tests/test_lorafa.py \
        tests/test_loraplus.py \
        tests/test_mapping.py \
        tests/test_osf.py \
        tests/test_pvera.py \
        tests/test_randlora.py \
        tests/test_shira.py \
        tests/test_vblora.py \
        tests/test_vera.py
}

package() {
    cd $_pkgname-$pkgver
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-py3-*-*.whl
}
