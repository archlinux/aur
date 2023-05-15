# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Maintainer: Mathieu Wespthal <mathieu.westphal+aur@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1
_name=f3d
_plugin=alembic
pkgname=$_name-plugin-$_plugin-git
pkgver=nightly.r4.gb0f4b37f
pkgrel=1
pkgdesc='A fast and minimalist 3D viewer - Alembic Plugin'
arch=('x86_64')
url="https://github.com/$_name-app/$_name"
license=('BSD')
depends=('f3d-core' 'alembic')
makedepends=('git' 'git-lfs' 'cmake' 'nlohmann-json')
source=("git+https://github.com/$_name-app/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name/plugins/$_plugin/"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ..
  cmake --build .
}

package() {
  cd "$srcdir/$_name/plugins/$_plugin/build"
  DESTDIR="$pkgdir" cmake --install .
  DESTDIR="$pkgdir" cmake --install . --component configuration
}
