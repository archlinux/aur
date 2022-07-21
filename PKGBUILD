# Maintainer: a821
# Contributor: mnovick1988
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: SleepyDog

pkgname=glew-git
pkgver=2.2.0.r41.g5a2307f
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="https://github.com/nigels-com/glew"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'glu')
makedepends=('git' 'python')
provides=('glew' 'libGLEW.so')
conflicts=('glew')
source=("git+$url"
        "git+https://github.com/KhronosGroup/OpenGL-Registry.git"
        "git+https://github.com/KhronosGroup/EGL-Registry.git"
        "git+https://github.com/nigels-com/glfixes"
        "glew-install.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '30c77b49ff64f5b936368426f957a217b6d8a3f8d0c83a7eaa69222ed45cd811')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g; s/glew.//'
}

prepare() {
  cd ${pkgname%-git}
  patch -Np1 -i ../glew-install.patch
  cd ../glfixes
  git checkout -b glew origin/glew
}

build() {
  cd ${pkgname%-git}/auto
  make REPO_OPENGL="$srcdir/OpenGL-Registry" REPO_EGL="$srcdir/EGL-Registry" \
       REPO_GLFIXES="$srcdir/glfixes"
  cd ..
  make STRIP= GLEW_PREFIX=/usr GLEW_DEST=/usr LIBDIR=/usr/lib
}

package() {
  cd ${pkgname%-git}
  make install.all DESTDIR="$pkgdir" GLEW_PREFIX=/usr GLEW_DEST=/usr LIBDIR=/usr/lib
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
