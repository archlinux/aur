# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
pkgname=python-pyclipr
_name=pyclipr
pkgver=0.1.8
pkgrel=1
pkgdesc="Python library for polygon clipping and offsetting based on Clipper2"
arch=('x86_64' 'aarch64')
url="https://github.com/drlukeparry/pyclipr"
license=('BSL-1.0')
depends=('python' 'python-numpy' 'glibc' 'libgcc' 'libstdc++')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-build-scripts'
             'python-scikit-build' 'python-scikit-build-core' 'python-pybind11-stubgen' 'python-wheel'
             'pybind11' 'eigen' 'cmake' 'ninja')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ff8360330f827dc4801a57cd18d3bc925814b6a9a05f14be1e0f8f72cc27488f')

prepare() {
  cd "$_name-$pkgver"
  # Use system pybind11 and eigen instead of the bundled copies (Clipper2 stays
  # bundled: it is compiled statically with USINGZ, which the AUR clipper2 lacks)
  sed -i 's|add_subdirectory(external/pybind11)|find_package(pybind11 CONFIG REQUIRED)|' CMakeLists.txt
  sed -i 's|set(EIGEN3_INCLUDE_DIR external/eigen)|set(EIGEN3_INCLUDE_DIR /usr/include/eigen3)|' CMakeLists.txt
  rm -rf external/pybind11 external/eigen
}

build() {
  cd "$_name-$pkgver"
  # scikit-build-core falls back to Python's sysconfig CXX when unset; on Arch Linux ARM
  # that is /usr/lib/distcc/bin/g++, which does not exist without distcc installed
  export CC="${CC:-gcc}" CXX="${CXX:-g++}"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  local _site="$PWD/test-site"
  rm -rf "$_site"
  python -m installer --destdir="$_site" dist/*.whl
  local _pydir=$(python -c 'import site; print(site.getsitepackages()[0])')
  PYTHONPATH="$_site$_pydir" python -c '
import numpy as np, pyclipr
pc = pyclipr.Clipper()
pc.scaleFactor = 1000
pc.addPath(np.array([[0., 0.], [0., 1.], [1., 1.], [1., 0.]]), pyclipr.Subject)
pc.addPath(np.array([[.5, .5], [.5, 1.5], [1.5, 1.5], [1.5, .5]]), pyclipr.Clip)
out = pc.execute(pyclipr.Intersection, pyclipr.FillRule.EvenOdd)
assert len(out) == 1 and len(out[0]) == 4, out
po = pyclipr.ClipperOffset()
po.scaleFactor = 1000
po.addPaths([np.array([[0., 0.], [0., 1.], [1., 1.], [1., 0.]])], pyclipr.JoinType.Miter, pyclipr.EndType.Polygon)
assert len(po.execute(0.1)) == 1
print("pyclipr smoke test OK")
'
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # CMake also installs a build-time export header into site-packages/include; not useful
  local _pydir=$(python -c 'import site; print(site.getsitepackages()[0])')
  rm -r "$pkgdir$_pydir/include"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
