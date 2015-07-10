# Contributor: Axper Jan <483ken _at_ gmail _dot_ com
# Contributor: Daniel Kirchner <ekpyron at lavabit dot com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>

_pkgbase=glfw
pkgbase="$_pkgbase-git"
pkgname=("$_pkgbase-x11-git" "$_pkgbase-wayland-git")
pkgver=3.1.1.r119.g0f3b69c
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url="http://www.glfw.org/"
license=('custom:ZLIB')
optdepends=('doxygen: build glfw html documentation')
makedepends=('cmake' 'git' 'libxi' 'libxrandr' 'libxinerama' 'libxcursor' 'wayland' 'libxkbcommon' 'libgl')
conflicts=("$_pkgbase")
provides=("$_pkgbase=3.2")
source=("$_pkgbase::git+https://github.com/glfw/glfw")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir/$_pkgbase/build-x11"
  mkdir -p "$srcdir/$_pkgbase/build-wayland"
}

package_glfw-x11-git() {
  depends=('libxi' 'libxrandr' 'libxinerama' 'libxcursor' 'libgl')
  pkgdesc="A free, open source, portable framework for OpenGL application development. (git, X11 version)"

  cd "$srcdir/$_pkgbase/build-x11"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DGLFW_BUILD_EXAMPLES=OFF \
    -DGLFW_BUILD_TESTS=OFF \
    -Wno-dev \
    ..
  make DESTDIR="$pkgdir" install
  install -D -m644 ../COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_glfw-wayland-git() {
  depends=('wayland' 'libxkbcommon' 'libgl')
  pkgdesc="A free, open source, portable framework for OpenGL application development. (git, Wayland version)"

  cd "$srcdir/$_pkgbase/build-wayland"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DGLFW_BUILD_EXAMPLES=OFF \
    -DGLFW_BUILD_TESTS=OFF \
    -DGLFW_USE_WAYLAND=ON \
    -Wno-dev \
    ..
  make DESTDIR="$pkgdir" install
  install -D -m644 ../COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
