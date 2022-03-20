# Maintainer: Sandy Carter <bwrsandman+aur@gmail.com>
# Contributor: Johannes Sjölund <j.sjolund+aur@gmail.com>

pkgname=glslang-git
pkgver=11.8.0.r20.g538231d8
pkgrel=2
pkgdesc='OpenGL and OpenGL ES shader front end and validator, git version'
arch=('x86_64' 'i686')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('gcc-libs' 'spirv-tools')
makedepends=('cmake' 'git' 'python')
options=('staticlibs')
provides=('glslang')
conflicts=('glslang')
source=("git+https://github.com/KhronosGroup/glslang.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags --exclude master-tot --exclude sdk\* --exclude SDK-candidate\* --exclude untagged\* | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DBUILD_SHARED_LIBS=ON \
        -B cmake-build-shared/ \
        -S .
  cmake --build cmake-build-shared/

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DBUILD_SHARED_LIBS=OFF \
        -B cmake-build-static/ \
        -S .
  cmake --build cmake-build-static/
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  cmake --install cmake-build-shared/ -v --strip --prefix "$pkgdir/usr"
  cmake --install cmake-build-static/ -v --strip --prefix "$pkgdir/usr"

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
