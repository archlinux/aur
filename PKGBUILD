pkgname=python-mujoco
pkgver=2.2.2
pkgrel=1
pkgdesc="Mujoco's Python bindings"
depends=('python' 'absl-py' 'python-glfw' 'python-numpy' 'python-opengl' 'mujoco')
makedepends=('python-setuptools' 'pybind11' 'abseil-cpp' 'eigen' 'cmake' 'git')
arch=('x86_64')
url="https://github.com/deepmind/mujoco"
license=('LGPL3')
source=("https://github.com/deepmind/mujoco/archive/refs/tags/$pkgver.tar.gz"
"mujoco.patch")
sha256sums=('7aad590d2ec6056f0235021e493db014784452538e45513c4c022de22d8270b0'
            '31871c9b0f3de7c004b5cd030bed5ab91b63f971bdb043aa7a0beee4af4d7a00')

build() {
  cd "${srcdir}/mujoco-${pkgver}"
  patch -Np1 -i "${srcdir}/mujoco.patch"
  cd "${srcdir}/mujoco-${pkgver}/python"
  PYTHONPATH="..:${PYTHONPATH}" python mujoco/codegen/generate_enum_traits.py > mujoco/enum_traits.h
  PYTHONPATH="..:${PYTHONPATH}" python mujoco/codegen/generate_function_traits.py > mujoco/function_traits.h
  cp ../LICENSE .
  mkdir -p cmake
  cp ../cmake/*.cmake cmake
  python setup.py build
}

package() {
  cd "${srcdir}/mujoco-${pkgver}/python"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
