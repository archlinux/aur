# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <redponike@proton.me>
# Contributor: Alex Hirzel <alex@hirzel.us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-pytorch-lightning
_pkgname=pytorch_lightning
pkgver=2.6.6
pkgrel=1
pkgdesc="The lightweight PyTorch wrapper for high-performance AI research"
arch=('any')
url='https://lightning.ai'
license=('Apache-2.0')
depends=(
  'python-fsspec'
  'python-lightning-utilities'
  'python-packaging'
  'python-pytorch'
  'python-torchmetrics'
  'python-tqdm'
  'python-typing_extensions'
  'python-yaml'
)
optdepends=(
  'python-aiohttp: for fsspec http filesystem support'
  'python-bitsandbytes: for quantization'
  'python-click: for the Lightning Fabric command-line interface'
  'python-docstring-parser: signatures and help for the LightningCLI'
  'python-fastapi: for serving model endpoints'
  'python-hydra-core: for Hydra configuration support'
  'python-jsonargparse: for the LightningCLI'
  'python-matplotlib: for plotting'
  'python-omegaconf: for OmegaConf configuration support'
  'python-psutil: for CPU and process resource detection'
  'python-rich: for rich terminal output'
  'python-tensorboardx: for TensorBoard logging'
  'python-torchvision: for vision demos and model helpers'
  'uvicorn: for serving model endpoints'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=(
  'python-aiohttp'
  'python-cloudpickle'
  'python-docstring-parser'
  'python-fastapi'
  'python-huggingface-hub'
  'python-jsonargparse'
  'python-jsonnet'
  'python-numpy'
  'python-omegaconf'
  'python-onnx'
  'python-onnx-ir'
  'python-onnxruntime-cpu'
  'python-onnxscript'
  'python-pandas'
  'python-psutil'
  'python-pytest'
  'python-pytest-rerunfailures'
  'python-pytest-timeout'
  'python-pytest-xdist'
  'python-rich'
  'python-scikit-learn'
  'python-tensorboardx'
  'python-torchvision'
  'python-typeshed-client'
  'tensorboard'
  'uvicorn'
)
# Lightning is a monorepo: the real code lives in src/lightning, and building with
# PACKAGE_NAME=pytorch runs the upstream .actions/assistant.py codegen that mirrors
# lightning.pytorch -> pytorch_lightning. Build from the repo tag (the PyPI sdist is
# just that codegen's pre-baked output).
_archive="pytorch-lightning-${pkgver}"
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Lightning-AI/pytorch-lightning/archive/refs/tags/${pkgver}.tar.gz"
  'pytest-rank-runner.py'
  'training.pt::https://pl-public-data.s3.amazonaws.com/MNIST/processed/training.pt'
  'test.pt::https://pl-public-data.s3.amazonaws.com/MNIST/processed/test.pt'
)
sha256sums=(
  '45753aa99dacacbc7dfa9b3f3feb9656afec3bfe84d3d6bc7815a8388ea8fbfd'
  '12fc1743c2f941944538df300867a523df3cd4a0b7658226d3f008d64971375e'
  '2f36393c2d71ef95251af44a755e40cef9ebdaad4422543dbf56e9d0716eb3d0'
  '1efeabc7f8ad1e8295ed03a956ec7aa3777bc2707c06405f9c9ac4312d8f91ee'
)

build() {
  cd "$_archive"
  export PACKAGE_NAME=pytorch
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"
  local _site _testroot
  _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  _testroot="$srcdir/_tests"
  rm -rf "$srcdir/_check" "$_testroot"
  python -m installer --destdir="$srcdir/_check" dist/*.whl
  cp -a tests "$_testroot"
  # Retain the real MNIST download/load tests using checksummed upstream data.
  # Read it via file URLs so each test still populates its own empty cache.
  python - "$_testroot" "$srcdir" <<'PY'
from pathlib import Path
import sys
p = Path(sys.argv[1]) / 'tests_pytorch/helpers/datasets.py'
s = p.read_text()
for name in ('training.pt', 'test.pt'):
    url = 'https://pl-public-data.s3.amazonaws.com/MNIST/processed/' + name
    assert s.count(url) == 1
    s = s.replace(url, (Path(sys.argv[2]) / name).resolve().as_uri())
p.write_text(s)
p = Path(sys.argv[1]) / 'tests_fabric/utilities/test_distributed.py'
s = p.read_text()
# Renaming PrivateUse1 is irreversible within an interpreter. This upstream
# test must not contaminate a later Adam optimizer's accelerator detection.
old = 'def test_get_default_process_group_backend_for_device():'
assert s.count(old) == 1
s = s.replace(old, '@RunIf(standalone=True)\n' + old)
p.write_text(s)
PY

  # Upstream's CI performs this same rewrite when testing the standalone
  # pytorch-lightning distribution rather than the unified `lightning` wheel.
  python .actions/assistant.py copy_replace_imports \
    --source_dir="$_testroot" \
    --source_import='lightning.fabric,lightning.pytorch' \
    --target_import='lightning_fabric,pytorch_lightning'

  export CUDA_VISIBLE_DEVICES=''
  export OMP_NUM_THREADS=2 MKL_NUM_THREADS=2 OPENBLAS_NUM_THREADS=2
  export PYTHONPATH="$srcdir/_check$_site:$_testroot"
  export TMPDIR="$srcdir/_pytest-tmp"
  export HF_HUB_OFFLINE=1
  export TRANSFORMERS_OFFLINE=1
  export WANDB_MODE=offline
  # PyTorch 2.14 emits this new deprecation before executing TorchScript on
  # Python 3.14. Keep running all scripted/traced roundtrips and assertions.
  export PYTHONWARNINGS='ignore:`torch.jit.script` is not supported in Python 3.14+:FutureWarning,ignore:`torch.jit.trace` is not supported in Python 3.14+:FutureWarning'
  export TORCH_HOME="$TMPDIR/torch"
  export XDG_CACHE_HOME="$TMPDIR/cache"
  rm -rf "$TMPDIR"
  install -d "$TMPDIR" "$TORCH_HOME" "$XDG_CACHE_HOME"

  cd "$_testroot"
  # This script deliberately captures stderr. Keep a failing assertion's
  # traceback visible even if it occurs before the stream is restored.
  python - <<'PY'
import runpy
import sys
import traceback
try:
    runpy.run_path('tests_pytorch/utilities/test_warnings.py', run_name='__main__')
except BaseException:
    traceback.print_exc(file=sys.__stderr__)
    raise
PY

  # Run the complete upstream Fabric and PyTorch unit/integration suites that
  # apply to this CPU-only, offline build.  RunIf performs upstream's own
  # hardware and unavailable-extra skips.  The explicit exclusions below are
  # limited to:
  # - the separately downloaded legacy-checkpoint corpus, which is absent from
  #   the signed tag archive;
  # - XLA/TPU and the one CUDA-only BitsAndBytes integration;
  # - the fake unregistered "pcu" device cases;
  # - assertions tied to older Click/Rich/PyTorch/jsonargparse warnings or
  #   rendered snapshots, while the rest of their modules still run.
  # loadscope keeps module-scoped distributed fixtures together while using the
  # allocated CPU cores.
  local -a _applicable_exclusions=(
    # Hydra's public recipe fails to build without its undeclared pkg_resources
    # input. Exclude only this optional CPU integration; keep Hydra optdepends
    # and the independent OmegaConf coverage. The Hydra DDP cases require GPUs
    # and are already skipped by upstream RunIf.
    '--deselect=tests_pytorch/models/test_hparams.py::test_model_save_hyper_parameters_interpolation_with_hydra'
    '--ignore=tests_pytorch/checkpointing/test_legacy_checkpoints.py'
    '--deselect=tests_pytorch/utilities/migration/test_utils.py::test_test_patch_legacy_imports_standalone'
    '--ignore-glob=*/test_xla.py'
    '--ignore-glob=*/test_xla_fsdp.py'
    '--deselect=tests_fabric/test_connector.py::test_accelerator_choice_tpu'
    '--deselect=tests_fabric/test_connector.py::test_unsupported_tpu_choice'
    '--deselect=tests_fabric/test_connector.py::test_connector_with_tpu_accelerator_instance'
    '--deselect=tests_fabric/test_connector.py::test_xla_fsdp_automatic_strategy_selection'
    '--deselect=tests_fabric/test_fabric.py::test_launch_and_strategies_unsupported_combinations[xla]'
    '--deselect=tests_fabric/utilities/test_throughput.py::test_get_available_flops'
    '--deselect=tests_fabric/strategies/test_single_device.py::test_clip_gradients[norm-32-true]'
    '--deselect=tests_fabric/strategies/test_single_device.py::test_clip_gradients[val-32-true]'
    '--deselect=tests_fabric/plugins/precision/test_bitsandbytes.py::test_bitsandbytes_plugin'
    '--deselect=tests_pytorch/plugins/precision/test_bitsandbytes.py::test_bitsandbytes_plugin'
    '--ignore=tests_pytorch/loops/test_training_loop_flow_scalar.py'
    '--deselect=tests_pytorch/loops/test_training_loop_flow_dict.py::test__training_step__flow_dict'
    '--deselect=tests_pytorch/loops/test_training_loop_flow_dict.py::test__training_step__tr_batch_end__flow_dict'
    '--deselect=tests_pytorch/loops/test_training_loop_flow_dict.py::test__training_step__epoch_end__flow_dict'
    '--deselect=tests_pytorch/loops/test_training_loop_flow_dict.py::test__training_step__batch_end__epoch_end__flow_dict'
    '--deselect=tests_pytorch/loops/test_evaluation_loop_flow.py::test__eval_step__flow'
    '--deselect=tests_pytorch/loops/test_evaluation_loop_flow.py::test__eval_step__epoch_end__flow'
    '--deselect=tests_fabric/plugins/precision/test_double_integration.py::test_double_precision'
    '--deselect=tests_fabric/plugins/precision/test_amp_integration.py::test_amp[cpu-bf16-mixed-expected_dtype1]'
    '--deselect=tests_pytorch/loops/test_prediction_loop.py::test_prediction_loop_batch_sampler_set_epoch_called'
    '--deselect=tests_pytorch/loops/optimization/test_closure.py::test_closure_with_no_grad_optimizer'
    '--deselect=tests_pytorch/trainer/logging_/test_eval_loop_logging.py::test_native_print_results'
    '--deselect=tests_pytorch/trainer/logging_/test_eval_loop_logging.py::test_rich_print_results[case3]'
    '--deselect=tests_pytorch/utilities/test_compile.py::test_trainer_compiled_model_that_logs'
    '--deselect=tests_pytorch/utilities/test_compile.py::test_trainer_compiled_model_test'
    '--deselect=tests_fabric/test_cli.py::test_run_through_fabric_entry_point'
    '--deselect=tests_pytorch/test_cli.py::test_lightning_cli_optimizer'
    '--deselect=tests_pytorch/test_cli.py::test_cli_trainer_no_callbacks'
    '--deselect=tests_pytorch/test_cli.py::test_lightning_cli_args_and_sys_argv_warning'
    '--deselect=tests_pytorch/test_cli.py::test_cli_parameter_with_lazy_instance_default'
  )

  # Build the standalone execution list from pytest's post-selection
  # session.items.  Pinning rootdir to the copied test tree is essential:
  # otherwise -c points pytest at the upstream source tree and changes node IDs
  # to ../_tests/..., so root-relative --deselect entries do not match.
  local _standalone_nodes="$TMPDIR/standalone-nodes"
  cat >"$TMPDIR/standalone_select.py" <<'PY'
import os
from pathlib import Path


def pytest_collection_finish(session):
    destination = Path(os.environ["PTL_SELECTED_FILE"])
    destination.write_text(
        "".join(f"{item.nodeid}\n" for item in session.items),
        encoding="utf-8",
    )
PY
  PYTHONPATH="$TMPDIR:$PYTHONPATH" \
  PTL_SELECTED_FILE="$_standalone_nodes.selected" \
  PL_RUN_STANDALONE_TESTS=1 \
  python -m pytest --collect-only -q --color=no \
    -p standalone_select \
    --rootdir="$_testroot" \
    -c "$srcdir/$_archive/pyproject.toml" \
    -m 'not cloud' "${_applicable_exclusions[@]}" \
    tests_fabric tests_pytorch >"$_standalone_nodes" 2>&1 || {
      cat "$_standalone_nodes" >&2
      return 1
    }
  test -s "$_standalone_nodes.selected"
  local _exclusion _excluded
  for _exclusion in "${_applicable_exclusions[@]}"; do
    case "$_exclusion" in
      --deselect=*)
        _excluded=${_exclusion#--deselect=}
        ! grep -F "$_excluded" "$_standalone_nodes.selected"
        ;;
      --ignore=*)
        _excluded=${_exclusion#--ignore=}
        ! grep -F "$_excluded::" "$_standalone_nodes.selected"
        ;;
    esac
  done
  ! grep -E '/test_xla(_fsdp)?\.py::' "$_standalone_nodes.selected"
  printf 'standalone_selection_preflight=pass selected=%s\n' \
    "$(wc -l <"$_standalone_nodes.selected")"

  local _suite_failed=0
  PL_RUN_STANDALONE_TESTS=0 \
  python -m pytest -ra -q -n 8 --dist loadscope --timeout=300 \
    --basetemp="$TMPDIR/suite" \
    -W 'ignore:torch.distributed.nn.functional.all_gather is deprecated:FutureWarning' \
    -W 'ignore:`torch.jit.script` is not supported in Python 3.14:FutureWarning' \
    -W 'ignore:`torch.jit.trace` is not supported in Python 3.14:FutureWarning' \
    -W 'ignore:`torch.jit.trace_method` is not supported in Python 3.14:FutureWarning' \
    -W 'ignore:`torch.jit.save` is not supported in Python 3.14:FutureWarning' \
    -W 'ignore:`torch.jit.load` is not supported in Python 3.14:FutureWarning' \
    --rootdir="$_testroot" \
    -c "$srcdir/$_archive/pyproject.toml" \
    -m 'not cloud' \
    "${_applicable_exclusions[@]}" \
    tests_fabric tests_pytorch || _suite_failed=1

  # The standalone marker's upstream contract requires every case to run in a
  # separate pytest process.  Derive the node IDs with upstream's own
  # PL_RUN_STANDALONE_TESTS collection filter so Fabric cases and future
  # parameter expansions cannot be silently omitted.  Hardware-only cases
  # remain collected and are reported as upstream RunIf skips.
  # Each xargs child is a distinct pytest process.  Four concurrent children
  # use the CPU allocation without allowing a re-executed DDP rank to leak
  # LOCAL_RANK into a later case.
  export PTL_PYPROJECT="$srcdir/$_archive/pyproject.toml"
  export PTL_PYTEST_RUNNER="$srcdir/pytest-rank-runner.py"
  export PTL_TEST_ROOT="$_testroot"
  xargs -r -d '\n' -n 1 -P 4 bash -c '
    node=$1
    key=$(printf "%s" "$node" | sha256sum | cut -c1-16)
    PL_RUN_STANDALONE_TESTS=1 \
    PL_PYTEST_BASETEMP="$TMPDIR/standalone-$key" \
    python "$PTL_PYTEST_RUNNER" -ra -q -s --timeout=300 \
      -W "ignore:torch.distributed.nn.functional.all_gather is deprecated:FutureWarning" \
      -W "ignore:\`torch.jit.script\` is not supported in Python 3.14:FutureWarning" \
      -W "ignore:\`torch.jit.trace\` is not supported in Python 3.14:FutureWarning" \
      -W "ignore:\`torch.jit.trace_method\` is not supported in Python 3.14:FutureWarning" \
      -W "ignore:\`torch.jit.save\` is not supported in Python 3.14:FutureWarning" \
      -W "ignore:\`torch.jit.load\` is not supported in Python 3.14:FutureWarning" \
      --rootdir="$PTL_TEST_ROOT" -c "$PTL_PYPROJECT" "$node"
  ' _ <"$_standalone_nodes.selected" || _suite_failed=1

  (( _suite_failed == 0 )) || return 1

  cd "$srcdir"
  python - <<'PY'
from pathlib import Path

import torch
from torch.utils.data import DataLoader, TensorDataset
import pytorch_lightning as pl

assert "_check" in str(Path(pl.__file__).resolve())

class Regressor(pl.LightningModule):
    def __init__(self):
        super().__init__()
        self.layer = torch.nn.Linear(1, 1)

    def training_step(self, batch, batch_idx):
        x, y = batch
        loss = torch.nn.functional.mse_loss(self.layer(x), y)
        self.log("train_loss", loss)
        return loss

    def configure_optimizers(self):
        return torch.optim.SGD(self.parameters(), lr=0.1)

torch.manual_seed(23)
x = torch.linspace(-1, 1, 32).unsqueeze(1)
loader = DataLoader(TensorDataset(x, 2 * x + 0.25), batch_size=8)
model = Regressor()
trainer = pl.Trainer(
    accelerator="cpu",
    devices=1,
    max_epochs=2,
    logger=False,
    enable_checkpointing=False,
    enable_progress_bar=False,
)
trainer.fit(model, loader)
assert trainer.global_step == 8
assert all(torch.isfinite(parameter).all() for parameter in model.parameters())
print({"lightning": pl.__version__, "global_step": trainer.global_step})
PY
}

package() {
  cd "$_archive"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # The monorepo build copies its setuptools code-generation helpers into the
  # wheel even though they are never imported at runtime.
  python - "$pkgdir" <<'PY'
import csv
import sys
import sysconfig
from pathlib import Path

site = Path(sys.argv[1]) / sysconfig.get_path("purelib").lstrip("/")
removed = set()
for namespace in ("lightning_fabric", "pytorch_lightning"):
    paths = [site / namespace / "__setup__.py"]
    paths.extend((site / namespace / "__pycache__").glob("__setup__.*.pyc"))
    for path in paths:
        if path.is_file():
            removed.add(path.relative_to(site).as_posix())
            path.unlink()
record, = site.glob("pytorch_lightning-*.dist-info/RECORD")
with record.open(newline="") as stream:
    rows = [row for row in csv.reader(stream) if row[0] not in removed]
with record.open("w", newline="") as stream:
    csv.writer(stream, lineterminator="\n").writerows(rows)
PY

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
