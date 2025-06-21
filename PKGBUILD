# Maintainer: Cerff_gursheel cerff_gur_sheel@disroot.org
pkgname=prismlauncher-cracked-git
pkgver=9.4.r5.g061218725
pkgrel=1
pkgdesc="A cracked and modified version of PrismLauncher patched for Java 8 compatibility and development use"
arch=('x86_64')
url="https://github.com/Diegiwg/PrismLauncher-Cracked"
license=('GPL')
depends=('jdk8-openjdk' 'cmake' 'qt5-tools' 'git')
makedepends=('java-environment-common')
source=("git+$url#branch=develop")
options=(!strip)
_gitname=PrismLauncher-Cracked
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_gitname"

  # Update necessary Git submodules for a proper build
  git submodule update --init --recursive

  # Modify compiler flags to ensure Java 8 compatibility
  sed -i 's/set(CMAKE_JAVA_COMPILE_FLAGS .*/set(CMAKE_JAVA_COMPILE_FLAGS --release 8 -Xlint:deprecation -Xlint:unchecked)/' libraries/javacheck/CMakeLists.txt
  sed -i 's/set(CMAKE_JAVA_COMPILE_FLAGS .*/set(CMAKE_JAVA_COMPILE_FLAGS --release 8)/' libraries/launcher/CMakeLists.txt
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make -j$(nproc)
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags 2>/dev/null | sed 's/[^-]*-g/r&/;s/-/./g' || \
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

