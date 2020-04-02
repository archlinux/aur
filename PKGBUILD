# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=gtirb
pkgname=gtirb-git
pkgver=v1.2.0.r91.g2aa2dcec
pkgrel=1
pkgdesc="GrammaTech Intermediate Representation for Binaries"
arch=('x86_64')
url="https://github.com/grammatech/gtirb"
license=('MIT')
optdepends=('boost: build against system boost'
            # Installed protobuf package also dramatically reduces build time.
            'protobuf: multi-language access to serialized GTIRB')
depends=()
makedepends=('git' 'cmake' 'python' 'doxygen' 'graphviz')
provides=('gtirb')
source=('git://github.com/grammatech/gtirb.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_COMPILER=clang++ -DGTIRB_PY_API=OFF -DGTIRB_CL_API=OFF
    cmake --build build --target all doc
}

package() {
  cd "$_srcname/"
  make -Cbuild DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/share/doc/$_srcname
  cp -R build-doc/html/ "$pkgdir"/usr/share/doc/$_srcname
}
