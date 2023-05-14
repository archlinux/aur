# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Maintainer: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1
_name=f3d
pkgname=$_name-git
pkgver=nightly.r2.gabca2cc5
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/$_name-app/$_name"
license=('BSD')
depends=('vtk' 'glew' 'netcdf' 'ospray' 'assimp' 'opencascade' 'alembic' 'draco' 'python' 'fmt')
makedepends=('git' 'git-lfs' 'cmake' 'help2man' 'pybind11' 'jdk-openjdk')
provides=('f3d')
conflicts=('f3d')
source=("git+https://github.com/$_name-app/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DF3D_BINDINGS_JAVA=ON \
        -DF3D_BINDINGS_PYTHON=ON \
        -DF3D_LINUX_GENERATE_MAN=ON \
        -DF3D_MODULE_EXTERNAL_RENDERING=ON \
        -DF3D_MODULE_RAYTRACING=ON \
        -DF3D_PLUGINS_STATIC_BUILD=ON \
        -DF3D_PLUGIN_BUILD_ALEMBIC=ON \
        -DF3D_PLUGIN_BUILD_ASSIMP=ON \
        -DF3D_PLUGIN_BUILD_DRACO=ON \
        -DF3D_PLUGIN_BUILD_OCCT=ON \
        ..
  cmake --build .
}

package() {
  cd "$srcdir/$_name/build"
  DESTDIR="$pkgdir" cmake --install .
  DESTDIR="$pkgdir" cmake --install . --component mimetypes
  DESTDIR="$pkgdir" cmake --install . --component sdk
  DESTDIR="$pkgdir" cmake --install . --component configuration
}
