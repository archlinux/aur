# Maintainer: Arzet Ro <arzeth0@gmail.com>
pkgname=python-deepspeed
pkgver=0.20.0
pkgrel=2
pkgdesc="DeepSpeed is a deep learning optimization library that makes distributed training and inference easy, efficient, and effective."
#depends=(python python-hjson ninja python-numpy python-packaging python-psutil python-py-cpuinfo python-pydantic python-pynvml python-pytorch python-tqdm)
#depends+=(python-cupy python-huggingface-hub tensorboard python-transformers python-mpi4py python-tabulate python-fairscale python-safetensors)
depends=(
	# according to `requirements.txt` (in `requirements/`):
	python-einops
	python-hjson
	python-pytorch
	python-torchvision
	python-py-cpuinfo
	libaio
	ca-certificates
	python-certifi
	python-pydantic
	python-psutil
	python-numpy
	python-msgpack
	python-tqdm

	# requirements-autotuning-ml.txt
	python-tabulate python-xgboost
	# ..... or `python-xgboost-cuda`.
	# Also `python-hjson` but it's already listed in `requirements.txt`.

	# requirements-deepcompile.txt
	python-scipy

	# requirements-inf.txt
	python-protobuf python-safetensors python-sentencepiece python-transformers
	# also: `lm-eval==0.3.0` and `qtorch` and `google`

	# requirements-sd.txt
	python-diffusers

	# requirements-sd.txt, requirements-triton.txt
	python-triton

	# ... Dependencies can also be found in `/environment.yml`,
	# which, unlike `/requirements/*.txt`, mention `python-torchaudio`.
	# My compilation failed when my python-torchaudio wasn't working:
	# `OSError: /usr/lib/python3.14/site-packages/torchaudio/lib/libtorchaudio.so: undefined symbol: _ZN3c104cuda29c10_cuda_check_implementationEiPKcS2_ib`
	python-torchaudio
)
# from accelerator import get_accelerator
makedepends=(python-build python-installer python-wheel ninja)
optdepends=(
	# requirements-torchembed.txt
		'python-torchembed>=0.3.0: Optional fused RoPE backend'
)
arch=('x86_64') # same as python-pytorch, python-torchvision
url="https://github.com/deepspeedai/DeepSpeed"
license=('Apache-2.0')
# 204 MiB, but building takes ~5 sec,
# and .pkg.tar.zst is 4 MiB (if `-18` is passed to `zstd`)
source=("https://github.com/deepspeedai/DeepSpeed/archive/refs/tags/v$pkgver.tar.gz")
sha384sums=('aa40c97885922eb0b86cf314305444e130dab9d7d26b78ee72c1716a7cffa02c7e1127bf299e76502c58a196999feb41')

build() {
	cd "${srcdir}/DeepSpeed-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/DeepSpeed-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	# `ds` and `dsr` are too short; we'd better
	# avoid possible collisions with other packages.
	# The package already provides /usr/bin/{deepspeed,ds_report}
	# which are exactly the same, i.e. aliases.
	rm "$pkgdir/usr/bin/ds"{,r}

	# See https://github.com/deepspeedai/DeepSpeed/commit/baa95c6256c1064f602049918cb64db3859cc00b
	rm "$pkgdir/usr/bin/ds_bench"
}
