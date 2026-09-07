# Maintainer: Arzet Ro <arzeth0@gmail.com>
pkgname=python-deepspeed
pkgver=0.19.6
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
		# has `python-neural-compressor==2.1.0`.
		# But `python-neural-compressor` in AUR is 3.8
		#
		#
		# `python-neural-compressor` is used only by
		# `deepspeed/compression/{compress.py,helper.py}`,
		# which use props (e.g. `neural_compressor.WeightPruningConfig`)
		# that aren't available in `python-neural-compressor==3.8`.
		# That's probably because
		# version 3.8 changelog at
		# https://github.com/intel/neural-compressor/releases/tag/v3.8
		# mentions `Removal of deprecated 2.x API`.
		#
		# BTW, ver 2.1.0 has never been in AUR and requires numpy <2.0,
		# but Arch Linux uses numpy 2.
		#
		# Those two `.py` files mention that this optional
		# `python-neural-compressor==2.1.0` is for:
		# "snip_momentum sparse pruning".
	# requirements-torchembed.txt
		'python-torchembed>=0.3.0: Optional fused RoPE backend'
)
arch=('x86_64') # same as python-pytorch, python-torchvision
url="https://github.com/deepspeedai/DeepSpeed"
license=('Apache-2.0')
# 208 MiB, but building takes ~5 sec,
# and .pkg.tar.zst is 4 MiB (if `-18` is passed to `zstd`)
source=("https://github.com/deepspeedai/DeepSpeed/archive/refs/tags/v$pkgver.tar.gz")
sha384sums=('153b6e838965106f9f955585211ce1d8fb6539c4408677e10794c4538564213792203d1c5bf8e45e262d30a42afd830b')

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
}
