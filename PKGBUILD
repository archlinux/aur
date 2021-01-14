# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Florian Pritz <flo@xinu.at>

_pkgbasename=glew
pkgname=lib32-$_pkgbasename-git
pkgver=2.2.0
pkgrel=1
pkgdesc="A cross-platform C/C++ extension loading library (32 bit)"
arch=('x86_64')
url="https://github.com/nigels-com/glew"
license=('BSD' 'MIT' 'GPL')
depends=('lib32-libxmu' 'lib32-libxi' 'lib32-glu' "$_pkgbasename>=$pkgver")
makedepends=('gcc-multilib')
provides=('libGLEW.so')
source=(git+https://github.com/nigels-com/glew.git
        glew-install.patch)
sha1sums=('SKIP'
          'e1bfa1e6ae3c7a553920978111092ea9d3a33c95')

pkgver() {
  cd glew
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glew
  patch -Np1 -i ../glew-install.patch
}


build() {
  cd glew

  sed -i 's|CC = cc|CC = gcc -m32|' config/Makefile.linux
  sed -i 's|LD = cc|LD = gcc -m32|' config/Makefile.linux
  sed -i 's|lib64|lib32|g' config/Makefile.linux

  cd ../
  cmake build/cmake/.
  make
}

package() {
  cd glew

  make DESTDIR="${pkgdir}" \
    PKGDIR="/usr/lib32/pkgconfig" install

  rm -rf "${pkgdir}"/usr/{include,bin}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/lib32-glew"
}
