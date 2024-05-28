# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>

pkgname=argos3-git
_gitname=argos3
pkgver=3.0.0.beta59.r70.g603f6276
pkgrel=1

pkgdesc="ARGoS 3 Large-scale robot simulator"
arch=('i686' 'x86_64')
url="http://www.argos-sim.info"
license=('MIT')

depends=(
  'freeglut>=2.6.0'
  'freeimage>=3.15'
  gcc-libs
  glibc
  glu
  libglvnd
  libxi
  libxmu
  lua
  qt6-base
)
makedepends=(
  'gcc>=5.4'
  'git'
  'cmake>=3.5.1'
  'doxygen>=1.7.3'
  'graphviz>=2.28'
)
optdepends=(
  'gperftools'
  'asciidoc: README compilation'
)

source=("git+https://github.com/ilpincy/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DARGOS_BUILD_NATIVE=ON \
    -Wno-dev \
    -S src -B build_simulator
  cmake --build build_simulator
}

package() {
  cd "$srcdir/$_gitname/build_simulator"
  make DESTDIR="$pkgdir/" doc
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/"
  install -Dm0644 "$srcdir/$_gitname/doc/ARGoS_LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
