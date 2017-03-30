# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>

pkgname=frcmake-git
pkgver=46.c66f929
pkgrel=5
pkgdesc="Some CMake stuff for use with the VxWorks 6.3 GCC Toolchain"
arch=(any)
provides=('frcmake')
conflicts=('frcmake')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('GPL')
depends=('wput' 'cmake')
options=('!strip' 'libtool' '!zipman')
source=("git+http://bitbucket.org/frc-cpp11/frcmake"
        "toolchain-cmake.patch")
sha512sums=('SKIP'
            '81c857782abb69c41375e3e4e82394b026ca6e1d66b3206906741ba16777e6d937a086cfd5c93d813b086a49bb452075bd1fcb5b36da082955b5df9f1c2a9851')

pkgver() {
  cd "${srcdir}/frcmake"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "${srcdir}/frcmake"

  git apply ../toolchain-cmake.patch
}

build() {
  cd "${srcdir}/frcmake"

  mkdir -p build && cd build
  cmake ..
  make
}

package() {
  cd "${srcdir}/frcmake/build"

  make DESTDIR=${pkgdir} install
  mv $pkgdir/usr/bin/frcmake $pkgdir/usr/bin/frcmake-wrs
}
