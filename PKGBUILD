# Maintainer: a821
# Contributor: mnovick1988
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: SleepyDog

pkgname=glew-git
pkgver=2.3.1.r6.g79cd72e
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="https://github.com/nigels-com/glew"
license=('BSD-3-Clause' 'MIT' 'GPL-2.0-or-later')
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
            'f44a506cbf8cb02d41a8feae581a83a77fb43d4b42e26be4eaec8ee99d925540')

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
  make -j1 REPO_OPENGL="$srcdir/OpenGL-Registry" REPO_EGL="$srcdir/EGL-Registry" \
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
