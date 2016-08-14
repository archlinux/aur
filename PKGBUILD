# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>

pkgname=frcmake-git
pkgver=46.c66f929
pkgrel=4
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
            'b8c1ed21eab5af8b04f17ae8699e6c5ccdb99eff943e42e2ff2a5f3baf4b157e2426e3677f5086ff1694b713fdb945fc3e21b88cb5e5b2ed65274726433f3972')

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
