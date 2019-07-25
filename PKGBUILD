# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=gtirb-pprinter
pkgname=gtirb-pprinter-git
pkgver=v0.1.1.r65.g3529870
pkgrel=1
pkgdesc="Pretty printer from GTIRB to assembly code"
arch=('x86_64')
url="https://github.com/grammatech/gtirb-pprinter"
license=('MIT')
optdepends=('boost: build against system boost')
depends=()
makedepends=('git' 'cmake' 'gtirb' 'capstone' 'python' 'doxygen' 'graphviz')
provides=('gtirb-pprinter')
source=('git://github.com/grammatech/gtirb-pprinter.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    # Build Source
    if [ -f /usr/include/boost/program_options.hpp ];then
      FLAGS="-DCMAKE_INSTALL_PREFIX=/usr -DGTIRB_PPRINTER_USE_SYSTEM_BOOST=ON"
    else
      FLAGS="-DCMAKE_INSTALL_PREFIX=/usr"
    fi
    # CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"
    # CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"
    # LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
    # CFLAGS="" CXXFLAGS="" LDFLAGS="" cmake . -Bbuild $FLAGS
    cmake ./ -Bbuild
    cmake --build build
    # Build Docs
    cmake doc/doxy/ -Bbuild-doc
    cmake --build build-doc --target doc
}

package() {
  cd "$_srcname/"
  make -Cbuild DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/share/doc/$_srcname
  cp -R build-doc/html/ "$pkgdir"/usr/share/doc/$_srcname
}
