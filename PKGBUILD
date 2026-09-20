# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-megatron-core
_pkgname=Megatron-LM
pkgver=0.19.2
pkgrel=1
_archive="$_pkgname-core_v$pkgver"
pkgdesc='NVIDIA Megatron-Core: GPU-optimized building blocks for training transformer models at scale'
arch=('x86_64')
url='https://github.com/NVIDIA/Megatron-LM'
license=('Apache-2.0' 'BSD-3-Clause' 'MIT')
depends=(
    'python'
    'python-numpy'
    'python-packaging>=24.2'
    'python-pytorch>=2.6.0'
    'python-setuptools>=80'
    'python-triton'
    'python-typing_extensions'
    'python-yaml'
)
makedepends=(
    'pybind11'
    'python-build'
    'python-installer'
    'python-wheel'
)
checkdepends=(
    'python-click'
    'python-msgpack'
    'python-omegaconf'
    'python-pytest'
    'python-requests'
    'python-transformers'
)
optdepends=(
    'python-absl: named communication-grid logging'
    'python-accelerate: Hugging Face distributed training integration'
    'python-apex: fused optimizers, normalization, and transformer kernels'
    'python-boto3: S3-backed datasets'
    'python-botocore: low-level S3 object-storage integration'
    'python-causal-conv1d: state-space model convolution kernels'
    'python-datasets: supervised fine-tuning datasets'
    'python-einops: tensor rearrangements and multi-latent attention'
    'python-flash-attn: FlashAttention support'
    'python-flashinfer: accelerated inference kernels'
    'python-flask: legacy text-generation server'
    'python-flask-restful: legacy text-generation REST API'
    'hypercorn: dynamic text-generation ASGI server'
    'python-mamba-ssm: Mamba state-space models'
    'python-msgpack: dynamic-inference request serialization'
    'python-nvidia-ml-py: GPU energy monitoring'
    'python-nvidia-modelopt: quantization and post-training optimization'
    'python-nvshmem: NVSHMEM resharding and copy services'
    'python-omegaconf: structured training configuration'
    'python-orjson: fast OpenAI-compatible response serialization'
    'python-psutil: asynchronous checkpoint process monitoring'
    'python-pyzmq: dynamic-inference communication'
    'python-quart: dynamic text-generation HTTP API'
    'python-sentencepiece: SentencePiece tokenizers'
    'python-tensorrt-llm: TensorRT-LLM engine export'
    'python-tiktoken: TikToken tokenizers'
    'python-tqdm: progress reporting'
    'python-transformer-engine: FP8 training and fused transformer kernels'
    'python-transformers: Hugging Face model and tokenizer interoperability'
    'python-wandb: experiment logging'
    'python-wget: Hugging Face tokenizer downloads'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/core_v$pkgver.tar.gz")
sha256sums=('4c16ccc2a0d4c1b6c96f59baaab99316ac3b39eca2ef960ddf4436a2962eb69a')

build() {
    cd "$_archive"
    export NO_VCS_VERSION=1
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive"
    local _site_packages
    _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    rm -rf "$srcdir/test-root" "$srcdir/test-run" "$srcdir/test-data"
    python -m installer --destdir="$srcdir/test-root" dist/*.whl
    install -d "$srcdir/test-run" "$srcdir/test-data"
    touch "$srcdir/test-data/.offline"
    cp -a tests "$srcdir/test-run/"
    sed -i \
        's#data_path = Path("/opt/data")#data_path = Path(os.environ["MEGATRON_TEST_DATA"])#' \
        "$srcdir/test-run/tests/unit_tests/conftest.py"
    cd "$srcdir/test-run"

    # Upstream's complete unit runner launches eight CUDA workers with NCCL.
    # Run its broad CPU-only surface here. The remaining deselection needs
    # optional Multi-Storage Client (not available in Arch/AUR); Transformers
    # cases run with their declared check dependency. CUDA/NCCL/FP8 and
    # multi-GPU suites remain hardware-bound.
    CUDA_VISIBLE_DEVICES= \
    HIP_VISIBLE_DEVICES= \
    ROCR_VISIBLE_DEVICES= \
    MEGATRON_TEST_DATA="$srcdir/test-data" \
    NO_VCS_VERSION=1 \
    PYTHONPATH="$srcdir/test-root$_site_packages" \
        python -m pytest -q -o addopts='' --basetemp="$srcdir/pytest-tmp" \
        tests/unit_tests/inference/test_common_inference_params.py \
        tests/unit_tests/inference/test_inference_config.py \
        tests/unit_tests/inference/test_inference_request.py \
        tests/unit_tests/inference/test_scheduler.py \
        tests/unit_tests/inference/test_stop_words.py \
        tests/unit_tests/optimizer/test_optimizer_config.py \
        tests/unit_tests/pipeline_parallel/test_helpers.py \
        tests/unit_tests/resharding/test_communication_scheduler.py \
        tests/unit_tests/resharding/test_dp_balancing.py \
        tests/unit_tests/resharding/test_planner.py \
        tests/unit_tests/resharding/test_task_segmenter.py \
        tests/unit_tests/resharding/test_workload_packer.py \
        tests/unit_tests/ssm/test_hybrid_layer_allocation.py \
        tests/unit_tests/test_argument_utils.py \
        tests/unit_tests/test_basic.py \
        tests/unit_tests/test_model_configs.py \
        tests/unit_tests/test_num_microbatches_calculator.py \
        tests/unit_tests/test_num_floating_point_operations.py \
        tests/unit_tests/test_optimizer_param_scheduler.py \
        tests/unit_tests/test_start_eval_at_iter.py \
        tests/unit_tests/test_typed_torch.py \
        tests/unit_tests/training/config/test_container_base.py \
        tests/unit_tests/training/config/test_instantiate_utils.py \
        tests/unit_tests/training/config/test_target_allowlist.py \
        tests/unit_tests/training/config/test_utils.py \
        tests/unit_tests/training/config/test_yaml_utils.py \
        tests/unit_tests/training/models/test_base.py \
        tests/unit_tests/transformer/test_mup.py \
        tests/unit_tests/transformer/test_quantization_config.py \
        tests/unit_tests/transformer/test_spec_utils.py \
        tests/unit_tests/utils/test_experimental_log_once.py \
        tests/unit_tests/utils/test_log_utils.py \
        tests/unit_tests/utils/test_slurm_utils.py \
        --deselect=tests/unit_tests/training/config/test_container_base.py::TestConfigContainer_ToYaml::test_to_yaml_with_msc_url

    # Exercise the compiled dataset helper and a single-rank, CPU-initialized GPT
    # training slice: embeddings, vocabulary projection, loss, and gradients.
    CUDA_VISIBLE_DEVICES= \
    HIP_VISIBLE_DEVICES= \
    ROCR_VISIBLE_DEVICES= \
    NO_VCS_VERSION=1 \
    PYTHONPATH="$srcdir/test-root$_site_packages" \
        python - <<'PY'
import tempfile

import numpy as np
import torch
import torch.distributed as dist
import torch.nn.functional as F

from megatron.core import parallel_state
from megatron.core.datasets.helpers import build_sample_idx
from megatron.core.models.gpt.gpt_layer_specs import get_gpt_layer_local_spec
from megatron.core.models.gpt.gpt_model import GPTModel
from megatron.core.transformer.transformer_config import TransformerConfig

sample_idx = build_sample_idx(
    np.array([5, 7], dtype=np.int32),
    np.array([0, 1], dtype=np.int32),
    sequence_length=4,
    num_epochs=1,
    tokens_per_epoch=12,
)
np.testing.assert_array_equal(sample_idx, [[0, 0], [0, 4], [1, 3]])

with tempfile.TemporaryDirectory() as tmpdir:
    dist.init_process_group(
        "gloo", rank=0, world_size=1, init_method=f"file://{tmpdir}/store"
    )
    parallel_state.initialize_model_parallel(
        tensor_model_parallel_size=1, pipeline_model_parallel_size=1
    )
    try:
        config = TransformerConfig(
            num_layers=2,
            hidden_size=32,
            num_attention_heads=4,
            ffn_hidden_size=64,
            use_cpu_initialization=True,
            hidden_dropout=0.0,
            attention_dropout=0.0,
        )
        torch.manual_seed(1234)
        model = GPTModel(
            config=config,
            transformer_layer_spec=get_gpt_layer_local_spec(),
            vocab_size=64,
            max_sequence_length=8,
            position_embedding_type="learned_absolute",
            parallel_output=False,
        )
        input_ids = torch.tensor([[1, 2, 3, 4], [4, 3, 2, 1]])
        position_ids = torch.arange(4).unsqueeze(0).expand(2, -1)
        hidden = model.embedding(input_ids, position_ids)
        logits, bias = model.output_layer(hidden, weight=None)
        targets = torch.tensor([[2, 3, 4, 5], [3, 2, 1, 0]]).T
        loss = F.cross_entropy(logits.reshape(-1, 64), targets.reshape(-1))
        loss.backward()

        assert bias is None
        assert logits.shape == (4, 2, 64)
        assert torch.isfinite(logits).all()
        assert 3.0 < loss.item() < 5.5
        assert model.embedding.word_embeddings.weight.grad.norm() > 0
        assert model.output_layer.weight.grad.norm() > 0
    finally:
        parallel_state.destroy_model_parallel()
        dist.destroy_process_group()
PY
}

package() {
    cd "$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed -n '/^This repository also contains code/,$p' LICENSE \
        > "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES"
}
