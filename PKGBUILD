pkgname=python-mujoco
pkgver=2.1.5
pkgrel=1
pkgdesc="Mujoco's Python bindings"
depends=('python' 'absl-py' 'python-glfw' 'python-numpy' 'python-opengl' 'mujoco')
makedepends=('python-setuptools' 'pybind11' 'abseil-cpp' 'eigen' 'cmake' 'git')
arch=('x86_64')
url="https://github.com/deepmind/mujoco"
license=('LGPL3')
source=("git+https://github.com/deepmind/mujoco.git#tag=$pkgver"
"mujoco.patch")
sha256sums=('SKIP'
            '980dd530674d497ebe72dc4e822d3a14e904c75a1840d5bfdc40e3c55f57b8db')

build() {
  cd "${srcdir}/mujoco"
  patch -Np1 -i "${srcdir}/mujoco.patch"
  cd "${srcdir}/mujoco/python"
  PYTHONPATH="..:${PYTHONPATH}" python mujoco/codegen/generate_enum_traits.py > mujoco/enum_traits.h
  PYTHONPATH="..:${PYTHONPATH}" python mujoco/codegen/generate_function_traits.py > mujoco/function_traits.h
  cp ../LICENSE .
  mkdir -p cmake
  cp ../cmake/*.cmake cmake
  python setup.py build
}

package() {
  cd "${srcdir}/mujoco/python"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
