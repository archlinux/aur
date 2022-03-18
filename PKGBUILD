pkgname=python-mujoco
pkgver=2.1.2.post1
pkgrel=1
pkgdesc="Mujoco's Python bindings"
depends=('python' 'mujoco-bin>=2.1.2' 'absl-py' 'python-glfw' 'python-numpy' 'python-opengl')
makedepends=('python-setuptools' 'pybind11' 'abseil-cpp' 'eigen' 'cmake')
arch=('x86_64')
url="https://github.com/deepmind/mujoco"
license=('LGPL3')
source=("git+https://github.com/deepmind/mujoco.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/mujoco/python"
  PYTHONPATH="..:${PYTHONPATH}" python mujoco/codegen/generate_enum_traits.py > mujoco/enum_traits.h
  PYTHONPATH="..:${PYTHONPATH}" python mujoco/codegen/generate_function_traits.py > mujoco/function_traits.h
  cp ../LICENSE .
  mkdir cmake
  cp ../cmake/*.cmake cmake
  sed -i "s/OFF$/ON/g" mujoco/CMakeLists.txt
  MUJOCO_PATH=/opt/mujoco python setup.py build
}

package() {
  cd "${srcdir}/mujoco/python"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
