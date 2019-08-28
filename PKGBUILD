# Contributor: Eric Schulte <eschulte@grammatech.com>
# Maintainer: Eric Schulte <eschulte@grammatech.com>
_srcname=gtirb
pkgname=gtirb-git
pkgver=v0.1.1.r344.gde2e2e0
pkgrel=1
pkgdesc="GrammaTech Intermediate Representation for Binaries"
arch=('x86_64')
url="https://github.com/grammatech/gtirb"
license=('MIT')
optdepends=('boost: build against system boost'
            # Installed protobuf package also dramatically reduces build time.
            'protobuf: multi-language access to serialized GTIRB')
depends=()
# graphviz -- to build the docs
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
    cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
    make -Cbuild
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
