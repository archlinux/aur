# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>
# Contributor: @xiota
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

_module="diffusers"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.41.0
pkgrel=1
pkgdesc='Pretrained diffusion models for image and audio generation in PyTorch'
url='https://github.com/huggingface/diffusers'
license=('Apache-2.0')
arch=('any')
groups=('huggingface')
depends=(
  'python-filelock'
  'python-importlib-metadata'
  'python-huggingface-hub>=1:1.32'
  # Arch carries epoch 1; Hub 2.x compatibility is exercised below.
  'python-huggingface-hub<1:3'
  'python-numpy'
  'python-pillow'
  'python-regex'
  'python-requests'
  'python-safetensors>=0.8.0'
)
optdepends=(
  'python-accelerate: multi-GPU and TPU training support'
  'python-datasets: datasets and data loading'
  'python-flax: JAX/FLAX support'
  'python-peft: parameter efficient fine-tunning'
  'python-pytest: packaged testing utilities'
  'python-pytorch: PyTorch support'
  'python-sentencepiece: tokenizer support for Kolors pipelines'
  'python-tensorflow: TensorFlow support'
  'python-torchvision: vision transforms and training utilities'
  'python-torchsde: stochastic differential equation schedulers'
  'python-transformers: text encoders and multimodal pipelines'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-socket'
  'python-pytest-timeout'
  'python-pytest-xdist'
  'python-pytorch'
  'python-scipy'
  'python-torchsde'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('a3420653e213514f984a32b0f62c79c7434ad63f776092724ed22c1570819833')

prepare() {
  cd "$_pkgsrc"
  sed -i '/License :: OSI Approved/d' setup.py
  sed -i 's/license=.*,/license="Apache-2.0",/' setup.py
  # Trial Arch's Hub 2.x API with the retained scheduler suite and installed
  # workflow; publication requires those compatibility gates to pass.
  sed -i 's/huggingface-hub>=1.32.0,<2.0/huggingface-hub>=1.32.0,<3.0/' setup.py
  python setup.py deps_table_update
}

build() {
  python -m build -nw "$_pkgsrc"
}

check() {
  local _check="$srcdir/check-install" _suite="$srcdir/check-suite" _site

  rm -rf "$_check" "$_suite"
  python -m installer --destdir="$_check" "$srcdir/$_pkgsrc"/dist/*.whl
  _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  mkdir -p "$_suite"
  cp -a "$srcdir/$_pkgsrc/tests" "$_suite/"
  cd "$_suite"

  # This is the largest dependency-self-contained upstream CPU shard. Optional
  # Flax cases use upstream skip decorators. The two deselected cases
  # unconditionally download a model from the Hugging Face Hub.
  HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 RUN_SLOW=no RUN_NIGHTLY=no \
    PYTHONPATH="$_check$_site" \
    timeout --signal=TERM --kill-after=2m 90m python -P -m pytest \
      -n 4 --max-worker-restart=0 --dist=loadfile -s -v \
      --timeout=300 --timeout-method=thread --disable-socket \
      --deselect=tests/schedulers/test_schedulers.py::SchedulerBaseTests::test_default_arguments_not_in_config \
      --deselect=tests/schedulers/test_schedulers.py::SchedulerBaseTests::test_default_solver_type_after_switch \
      tests/schedulers

  PKGVER="$pkgver" TEST_ROOT="$_check" PYTHONPATH="$_check$_site" \
    python -P - <<'PY'
from importlib.metadata import version
import os
from pathlib import Path

import torch
import diffusers
from diffusers import DDPMScheduler

assert version("diffusers") == diffusers.__version__ == os.environ["PKGVER"]
assert Path(diffusers.__file__).resolve().is_relative_to(
    Path(os.environ["TEST_ROOT"]).resolve()
)
scheduler = DDPMScheduler(num_train_timesteps=20)
sample = torch.linspace(-1.0, 1.0, 96).reshape(2, 3, 4, 4)
noise = torch.full_like(sample, 0.125)
timestep = torch.tensor([7, 7], dtype=torch.long)
noisy = scheduler.add_noise(sample, noise, timestep)
result = scheduler.step(noise, 7, noisy).prev_sample
assert result.shape == sample.shape
assert torch.isfinite(result).all()
PY
}

package() {
  cd "$_pkgsrc"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
}
