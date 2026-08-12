# Maintainer: Arzet Ro <arzeth0@gmail.com>
pkgname=python-deepspeed
pkgver=0.19.5
pkgrel=1
pkgdesc="DeepSpeed is a deep learning optimization library that makes distributed training and inference easy, efficient, and effective."
#depends=(python python-hjson ninja python-numpy python-packaging python-psutil python-py-cpuinfo python-pydantic python-pynvml python-pytorch python-tqdm)
#depends+=(python-cupy python-huggingface-hub tensorboard python-transformers python-mpi4py python-tabulate python-fairscale python-safetensors)
depends=(
	# requirements.txt and/or requirements/requirements.txt
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

	# requirements-1bit-mpi.txt
	python-mpi4py

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

	# requirements-sd.txt, requirements-sparse_attn.txt, requirements-triton.txt
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
	# requirements-sparse_pruning.txt
		# python-neural-compressor==2.1.0
		# python-neural-compressor
		# is not in AUR and requires numpy <2.0, therefore commented.
	# requirements-torchembed.txt
		'python-torchembed>=0.3.0: Optional fused RoPE backend'
)
arch=('x86_64') # same as python-pytorch, python-torchvision
url="https://github.com/deepspeedai/DeepSpeed"
license=('Apache-2.0')
# 207 MiB, but building takes ~5 sec, and .pkg.tar.zst is 3 MiB
source=("https://github.com/deepspeedai/DeepSpeed/archive/refs/tags/v$pkgver.tar.gz")
sha384sums=('d7ab69aed734b1b1843c99c37b4a69ab460f55ad6017c8f290a666fd09e4d667019149382dcf035c5c60e3fd486c7ca1')

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
	# which are exactly the same — aliases.
	rm "$pkgdir/usr/bin/ds"{,r}
}
