# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=gtirb-pprinter
pkgname=gtirb-pprinter-git
pkgver=v0.1.0.r0.gb27ae54
pkgrel=1
pkgdesc="Pretty printer from GTIRB to assembly code"
arch=('x86_64')
url="https://github.com/grammatech/gtirb-pprinter"
license=('MIT')
depends=()
makedepends=('git' 'cmake' 'gtirb' 'capstone')
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
    # CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"
    # CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"
    # LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
    CFLAGS="" CXXFLAGS="" LDFLAGS="" cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
    make -Cbuild
    # Build Docs
    cmake doc/doxy/ -Bbuild-doc
    cd build-doc
    cmake --build . --target doc
}

package() {
  cd "$_srcname/"
  make -Cbuild DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/share/doc/$_srcname
  cp -R build-doc/html/ "$pkgdir"/usr/share/doc/$_srcname
}
