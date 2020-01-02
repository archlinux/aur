# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=ddisasm
pkgname=ddisasm-git
pkgver=v0.1.1.r220.gd9ffe7f
pkgrel=1
pkgdesc="A fast and accurate disassembler"
arch=('x86_64')
url="https://github.com/grammatech/ddisasm"
license=('aGPLv3')
optdepends=('boost: build against system boost')
depends=('capstone' 'libehp')
makedepends=('git' 'cmake' 'souffle' 'mcpp' 'lief' 'gtirb' 'gtirb-pprinter')
provides=('ddisasm')
source=('git://github.com/grammatech/ddisasm.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    if [ -f /usr/include/boost/program_options.hpp ];then
      FLAGS="-DCMAKE_INSTALL_PREFIX=/usr -DDDISASM_USE_SYSTEM_BOOST=ON"
    else
      FLAGS="-DCMAKE_INSTALL_PREFIX=/usr"
    fi
    # CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"
    # CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"
    # LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
    # CFLAGS="" CXXFLAGS="" LDFLAGS="" cmake . -Bbuild $FLAGS
    cmake . -Bbuild $FLAGS
    make -C build
}

package() {
  cd "$_srcname/build"
  make DESTDIR="$pkgdir" install
}
