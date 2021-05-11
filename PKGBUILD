# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=gtirb-pprinter
pkgname=gtirb-pprinter-git
pkgver=v0.1.1.r248.g48aa1e6
pkgrel=1
pkgdesc="Pretty printer from GTIRB to assembly code"
arch=('x86_64')
url="https://github.com/grammatech/gtirb-pprinter"
license=('MIT')
optdepends=('boost: build against system boost')
depends=()
makedepends=('git' 'cmake' 'gtirb' 'capstone' 'python' 'doxygen' 'graphviz')
provides=('gtirb-pprinter')
source=('git+https://github.com/grammatech/gtirb-pprinter.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    cmake ./ -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
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
