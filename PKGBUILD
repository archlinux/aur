pkgname=python-mujoco
pkgver=3.3.7
pkgrel=1
pkgdesc="Mujoco's Python bindings"
depends=('python' 'absl-py' 'python-glfw' 'python-numpy' 'python-opengl' 'mujoco')
makedepends=('python-setuptools' 'pybind11' 'abseil-cpp' 'eigen' 'cmake' 'git' 'lodepng')
arch=('x86_64')
url="https://github.com/deepmind/mujoco"
license=('LGPL3')
source=("https://github.com/deepmind/mujoco/archive/refs/tags/$pkgver.tar.gz"
"mujoco.patch")
sha256sums=('a410cfc3623c34f45cb541ffe11094d7d99ff4b9cc242460819e51fdad14630a'
            '052eb9320fbe94a095303cd7b9ea2dd8fc41c39f4e4f164eab8ca1087a23e6da')

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
