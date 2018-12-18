# Maintainer: John Schoenick <john@pointysoftware.net>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=lib32-heaptrack-git
pkgver=812.f6a3479
pkgrel=1
pkgdesc="A heap memory profiler"
arch=('i686' 'x86_64')
url="http://milianw.de/tag/heaptrack"
license=('APACHE')
# dependencies with GUI enabled
depends=('kdiagram' 'threadweaver' 'kitemmodels' 'kio' 'heaptrack-git' 'lib32-boost-libs')
makedepends=('git' 'extra-cmake-modules' 'sparsehash')
# minimal dependencies
#depends=('libunwind' 'boost-libs')
#makedepends=('git' 'cmake' 'boost')
provides=('lib32-heaptrack')
conflicts=('lib32-heaptrack')
source=('git+https://github.com/KDE/heaptrack.git')
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

  # Using the dependency on the main package for gui, just build libs and helpers to run against
  # 32bit
  export CXXFLAGS="$CXXFLAGS -lboost_iostreams -lboost_system -DBOOST_NO_CXX11_HDR_SYSTEM_ERROR"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  cmake ../heaptrack \
        -DHEAPTRACK_BUILD_GUI=OFF \
        -DLIB_SUFFIX=32 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # Provided by full 64bit package that we depend on
  rm -rf "$pkgdir"/usr/include

  # No way to set an executable suffix through cmake, so rename here.  The script does properly use
  # the LIB_SUFFIX we provided above and will load the 32bit libraries.
  for output in "$pkgdir"/usr/bin/*; do
    [[ -f $output ]] || continue
    msg2 "Renaming $(basename "$output") -> $(basename "${output}32")"
    mv "$output" "${output}32"
  done
}

# vim:set ts=2 sw=2 et:
