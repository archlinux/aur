# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Exorcism
# Contributor: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=xformers
pkgname=python-${_name}
pkgver=0.0.35
pkgrel=1
pkgdesc="Transformers building blocks, supporting a composable construction"
arch=('x86_64')
url="https://github.com/facebookresearch/${_name}"
license=(BSD-3-Clause)
depends=(
	'python'
	'python-pytorch'
	'python-numpy'
	'python-nvidia-ml-py'
	'python-triton'
	'python-scipy'
	'python-pytest'
	'python-tqdm'
	'python-matplotlib'
	'python-pandas'
	'python-typing_extensions'
	'cuda'
	'libstdc++'
	'libgcc'
	'glibc'
)
makedepends=(
	'python-wheel'
	'python-fsspec'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
	'ninja'
	'git'
)
source=(
	"git+https://github.com/facebookresearch/xformers.git#tag=v${pkgver}"
	"cutlass::git+https://github.com/NVIDIA/cutlass.git"
)
sha256sums=('685e57c23111cfec622f3297f2cba10308496fd513bda46813159309cfc667fb'
            'SKIP')

prepare() {
	cd "${_name}"

	git submodule init
	git config submodule."third_party/cutlass".url "${srcdir}/cutlass"
	# Disable ck, it's only for ROCm
	git config submodule."third_party/composable_kernel_tiled".update none
	git -c protocol.file.allow=always submodule update --init
}

build() {
	cd "${_name}"

	export CFLAGS='-DGLOG_USE_GLOG_EXPORT'
	export CCFLAGS='-DGLOG_USE_GLOG_EXPORT'
	export NVCC_APPEND_FLAGS='-DGLOG_USE_GLOG_EXPORT'
	export CXXFLAGS='-DGLOG_USE_GLOG_EXPORT'

	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
