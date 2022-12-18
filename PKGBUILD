# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Maintainer: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1
_name=f3d
pkgname=$_name-git
pkgver=nightly.r0.g2596b19
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/$_name-app/$_name"
license=('BSD')
depends=('vtk' 'glew' 'pugixml' 'netcdf' 'ospray' 'assimp' 'opencascade' 'alembic' 'draco' 'jdk-openjdk' 'python' 'fmt' 'utf8cpp' 'draco_static_lib_compat')
makedepends=('git' 'git-lfs' 'cmake' 'help2man' 'openmp' 'pybind11')
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
        -DF3D_INSTALL_DEFAULT_CONFIGURATION_FILE=ON \
        -DF3D_GENERATE_MAN=ON \
        -DF3D_INSTALL_MIME_TYPES_FILES=ON \
        -DF3D_INSTALL_THUMBNAILER_FILES=ON \
        -DF3D_BINDINGS_PYTHON=ON \
        -DF3D_BINDINGS_JAVA=ON \
        -DF3D_INSTALL_SDK=ON \
        -DF3D_PLUGINS_STATIC_BUILD=ON \
        -DF3D_PLUGIN_BUILD_ALEMBIC=ON \
        -DF3D_PLUGIN_BUILD_ASSIMP=ON \
        -DF3D_PLUGIN_BUILD_DRACO=ON \
        -DF3D_PLUGIN_BUILD_OCCT=ON \
        -DF3D_MODULE_RAYTRACING=ON \
        -DF3D_MODULE_EXTERNAL_RENDERING=ON \
        ..
  make
}

package() {
  cd "$srcdir/$_name/build"
  make DESTDIR="$pkgdir" install
}
