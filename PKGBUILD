pkgname=python-mujoco
pkgver=2.1.3
pkgrel=1
pkgdesc="Mujoco's Python bindings"
depends=('python' 'absl-py' 'python-glfw' 'python-numpy' 'python-opengl' 'mujoco')
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
  mkdir -p cmake
  cp ../cmake/*.cmake cmake
  sed -i "s/OFF$/ON/g" mujoco/CMakeLists.txt
  sed -i "s/self._find_mujoco()/\"\/usr\/lib\",\"\/usr\/include\/mujoco\"/g" setup.py
  sed -i "/self._copy_external_libraries()/d" setup.py
  sed -i "/self._copy_mujoco_headers()/d" setup.py
  python setup.py build
}

package() {
  cd "${srcdir}/mujoco/python"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  cd $pkgdir/$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')/mujoco
  ln -s /usr/include/mujoco ./include
  ln -s /usr/lib/libmujoco.so ./libmujoco.so
  ln -s /usr/lib/libmujoco.so.$pkgver ./libmujoco.so.$pkgver
  ln -s /usr/lib/libmujoco_nogl.so ./libmujoco_nogl.so
  ln -s /usr/lib/libmujoco_nogl.so.$pkgver ./libmujoco_nogl.so.$pkgver
  ln -s /opt/mujoco/lib/libglew.so ./libglew.so
  ln -s /opt/mujoco/lib/libglewegl.so ./libglewegl.so
  ln -s /opt/mujoco/lib/libglewosmesa.so ./libglewosmesa.so
}
