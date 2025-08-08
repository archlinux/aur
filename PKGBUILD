pkgname=python-mujoco
pkgver=3.3.2
pkgrel=1
pkgdesc="Mujoco's Python bindings"
depends=('python' 'absl-py' 'python-glfw' 'python-numpy' 'python-opengl' 'mujoco')
makedepends=('python-setuptools' 'pybind11' 'abseil-cpp' 'eigen' 'cmake' 'git' 'lodepng')
arch=('x86_64')
url="https://github.com/deepmind/mujoco"
license=('LGPL3')
source=("https://github.com/deepmind/mujoco/archive/refs/tags/$pkgver.tar.gz"
"mujoco.patch")
sha256sums=('6ab615adc0f6533cc9dbc63b8255017ee9a10d0c9ba1c4298ef948480e790946'
            '2d260424c9738f2c4c9e3fd2bcefc5ca007e1514de24ebb5fa42ad084bb340fa')

build() {
  cd "${srcdir}/mujoco-${pkgver}"
  patch -Np1 -i "${srcdir}/mujoco.patch"
  cd "${srcdir}/mujoco-${pkgver}/python"
  PYTHONPATH="../python/mujoco:${PYTHONPATH}" python mujoco/codegen/generate_enum_traits.py > mujoco/enum_traits.h
  PYTHONPATH="../python/mujoco:${PYTHONPATH}" python mujoco/codegen/generate_function_traits.py > mujoco/function_traits.h
  PYTHONPATH="../python/mujoco:${PYTHONPATH}" python mujoco/codegen/generate_spec_bindings.py > mujoco/specs.cc.inc
  cp ../LICENSE .
  mkdir -p mujoco/cmake
  cp ../cmake/*.cmake mujoco/cmake
  cp -r ../simulate mujoco
  python setup.py build
}

package() {
  cd "${srcdir}/mujoco-${pkgver}/python"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
