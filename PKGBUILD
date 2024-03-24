# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Sandy Carter <bwrsandman+aur@gmail.com>
# Contributor: Johannes Sjölund <j.sjolund+aur@gmail.com>

pkgname=glslang-minimal-git
_name=glslang
pkgver=14.1.0.r7.g32257786
pkgrel=3
pkgdesc='OpenGL and OpenGL ES shader front end and validator, git version'
arch=('x86_64')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('gcc-libs' 'spirv-tools-git')
makedepends=('cmake' 'git' 'python')
options=('staticlibs')
provides=('glslang')
conflicts=('glslang')
source=("git+https://github.com/KhronosGroup/glslang.git")
sha256sums=('SKIP')
options=(!lto !debug)

pkgver() {
  cd $_name
  git describe --long --tags --exclude main-tot --exclude sdk\* --exclude SDK-candidate\* --exclude untagged\* | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_name

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
        -DBUILD_SHARED_LIBS=ON \
        -B cmake-build-shared/ \
        -S .
  cmake --build cmake-build-shared/

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
        -DBUILD_SHARED_LIBS=OFF \
        -B cmake-build-static/ \
        -S .
  cmake --build cmake-build-static/
}

package() {
  cd $_name
  cmake --install cmake-build-shared/ -v --strip --prefix "$pkgdir/usr"
  cmake --install cmake-build-static/ -v --strip --prefix "$pkgdir/usr"
  
  pushd "$pkgdir"/usr/bin
  ln -s glslang glslangValidator
  popd
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
