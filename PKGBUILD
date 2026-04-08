# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Exorcism
# Contributor: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=xformers
pkgname=python-${_name}-rocm
pkgver=0.0.35
pkgrel=1
pkgdesc="Transformers building blocks, supporting a composable construction"
arch=('x86_64')
url="https://github.com/facebookresearch/${_name}"
license=(BSD-3-Clause)
depends=(
	'python'
	'python-pytorch-rocm'
	'python-numpy'
	'python-triton'
	'python-scipy'
	'python-pytest'
	'python-tqdm'
	'python-matplotlib'
	'python-pandas'
	'python-typing_extensions'
	'libstdc++'
	'libgcc'
	'glibc'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'git'
	'ninja'
)
source=(
	"git+https://github.com/facebookresearch/xformers.git#tag=v${pkgver}"
	"composable_kernel::git+https://github.com/ROCm/composable_kernel.git"
	"cutlass::git+https://github.com/NVIDIA/cutlass.git"
)
sha256sums=('685e57c23111cfec622f3297f2cba10308496fd513bda46813159309cfc667fb'
            'SKIP'
            'SKIP')

prepare() {
	cd "${_name}"

	git submodule init
	git config submodule."third_party/composable_kernel_tiled".url "${srcdir}/composable_kernel"
	# The build still checks for cutlass, even though it's only for CUDA
	git config submodule."third_party/cutlass".url "${srcdir}/cutlass"
	git -c protocol.file.allow=always submodule update --init
}

build() {
	cd "${_name}"

	export HIPCC_COMPILE_FLAGS_APPEND='-DGLOG_USE_GLOG_EXPORT'

	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
