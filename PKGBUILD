# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Maintainer: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1
_name=f3d
pkgname=$_name-git
pkgver=v1.2.0.r0.gaaefc66
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/$_name-app/$_name"
license=('BSD')
depends=('vtk' 'glew' 'pugixml' 'netcdf' 'ospray' 'assimp' 'opencascade')
makedepends=('git' 'git-lfs' 'cmake')
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
        -DBUILD_TESTING=OFF \
        -DF3D_INSTALL_DEFAULT_CONFIGURATION_FILE=ON \
        -DF3D_GENERATE_MAN=ON \
        -DF3D_INSTALL_MIME_TYPES_FILE=ON \
        -DF3D_INSTALL_THUMBNAILER_FILES=ON \
        -DF3D_MODULE_OCCT=ON \
        -DF3D_MODULE_ASSIMP=ON \
        -DF3D_MODULE_RAYTRACING=ON \
        ..
  make
}

package() {
  cd "$srcdir/$_name/build"
  make DESTDIR="$pkgdir" install
}
