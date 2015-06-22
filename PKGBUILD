# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=eglut-git
pkgver=8.2.0.5978.87a60bf
pkgrel=1
pkgdesc="The OpenGL Utility Toolkit for EGL. From mesa demos with Wayland backend."
arch=(i686 x86_64)
depends=('glew' 'libegl' 'freeglut' 'wayland')
makedepends=('git')
provides=("eglut"=$pkgver)
conflicts=('eglut')
url="http://cgit.freedesktop.org/mesa/demos/tree/src/egl/eglut"
license=(custom)

source=("git://anongit.freedesktop.org/mesa/demos"
        "0001-eglut-add-wayland-backend-to-build.patch")
sha256sums=("SKIP" 
            "15d038a859aab3fe2ba10496e5b0f0b5cc0bad7276f13ee0120d5911c8c99b6c")
_gitname="demos"


pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(\[mesa-demos\], \[//' | sed 's/\],//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $version.$revision.$hash  
}

prepare() {
  cd $_gitname
  git am ../0001-eglut-add-wayland-backend-to-build.patch
}

build() {
  cd $_gitname
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -DWAYLAND_FOUND=1
  cd src/egl/eglut
  make
}
package() {
  cd $_gitname/src/egl/eglut
  make DESTDIR="${pkgdir}" install
  
  mkdir -p "${pkgdir}/usr/include/EGL"
  cp $srcdir/$_gitname/src/egl/eglut/eglut.h "${pkgdir}/usr/include/EGL"
}
