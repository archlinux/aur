# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=boolector
pkgver=3.0.0
pkgrel=1
pkgdesc="Boolector is an efficient SMT solver for the quantifier-free theory of bit-vectors in combination with the quantifier-free extensional theory of arrays."
arch=('i686' 'x86_64')
url="http://boolector.github.io/"
license=('MIT')
makedepends=()
conflicts=()

source=("https://github.com/Boolector/boolector/archive/3.0.0.tar.gz")
md5sums=('b0d6755dd8a9706adac0d5d94f38abb9')

build() {
  cd "$srcdir/boolector-3.0.0"

  # Download and build Lingeling
  ./contrib/setup-lingeling.sh

  # Download and build BTOR2Tools
  CFLAGS="" ./contrib/setup-btor2tools.sh

  # Build Boolector
  CFLAGS="" ./configure.sh && cd build && make
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/include/boolector"

  cd "$srcdir/boolector-3.0.0/src"
  find . -name "*.h" -exec install -D -m644 {} "$pkgdir/usr/include/boolector/{}" \;

  cd "$srcdir/boolector-3.0.0"
  find . -name "*.a" -exec install -m755 {} "$pkgdir/usr/lib/" \;

  cd "$srcdir/boolector-3.0.0/build/bin"
  find . -name "b*"  -exec install -D -m755 {} "$pkgdir/usr/bin/{}" \;
}
