pkgname=python-mujoco
pkgver=2.3.6
pkgrel=1
pkgdesc="Mujoco's Python bindings"
depends=('python' 'absl-py' 'python-glfw' 'python-numpy' 'python-opengl' 'mujoco')
makedepends=('python-setuptools' 'pybind11' 'abseil-cpp' 'eigen' 'cmake' 'git')
arch=('x86_64')
url="https://github.com/deepmind/mujoco"
license=('LGPL3')
source=("https://github.com/deepmind/mujoco/archive/refs/tags/$pkgver.tar.gz"
"mujoco.patch")
sha256sums=('3ede20f8be574baa65ee6164f90c91b787adbe2b877cc4cc8bd1c6678f747354'
            '3d6b5be9b65081e6bc18209f320c608b5e94b659c34483a4f49fb5bad56addd4')

build() {
  cd "${srcdir}/mujoco-${pkgver}"
  patch -Np1 -i "${srcdir}/mujoco.patch"
  cd "${srcdir}/mujoco-${pkgver}/python"
  PYTHONPATH="..:${PYTHONPATH}" python mujoco/codegen/generate_enum_traits.py > mujoco/enum_traits.h
  PYTHONPATH="..:${PYTHONPATH}" python mujoco/codegen/generate_function_traits.py > mujoco/function_traits.h
  cp ../LICENSE .
  mkdir -p cmake
  cp ../cmake/*.cmake cmake
  cp -r ../simulate mujoco
  python setup.py build
}

package() {
  cd "${srcdir}/mujoco-${pkgver}/python"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
