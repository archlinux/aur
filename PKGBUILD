pkgname=python-mujoco
pkgver=2.2.1
pkgrel=1
pkgdesc="Mujoco's Python bindings"
depends=('python' 'absl-py' 'python-glfw' 'python-numpy' 'python-opengl' 'mujoco')
makedepends=('python-setuptools' 'pybind11' 'abseil-cpp' 'eigen' 'cmake' 'git')
arch=('x86_64')
url="https://github.com/deepmind/mujoco"
license=('LGPL3')
source=("https://github.com/deepmind/mujoco/archive/refs/tags/$pkgver.tar.gz"
"mujoco.patch")
sha256sums=('e7fa0821c993073b19bd8034df63661e309edcdc2d602101c3f9b28201574ded'
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
