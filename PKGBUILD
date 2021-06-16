# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=heaptrack-git
pkgver=682.c6ef628
pkgrel=1
pkgdesc="A heap memory profiler"
arch=('i686' 'x86_64')
url="http://milianw.de/tag/heaptrack"
license=('APACHE')
# dependencies with GUI enabled
depends=('kdiagram' 'threadweaver' 'kitemmodels' 'kio' 'boost-libs')
makedepends=('git' 'extra-cmake-modules' 'boost' 'sparsehash')
# minimal dependencies
#depends=('libunwind' 'boost-libs')
#makedepends=('git' 'cmake' 'boost')
provides=('heaptrack')
conflicts=('heaptrack')
source=('heaptrack::git+https://invent.kde.org/sdk/heaptrack.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/heaptrack"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  export CXXFLAGS="$CXXFLAGS -lboost_iostreams"
  cmake ../heaptrack \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
