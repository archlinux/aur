# Maintainer: Victor Golovanenko <drygdryg2014 at domain yandex.com>
pkgname=kaitai-struct-compiler-serialization-git
_pkgname='kaitai-struct-compiler'
pkgver=0.10.r94.gf1dc857
pkgrel=1
pkgdesc="Compiler for the Kaitai declarative binary format parsing language. Serialization support included."
arch=('any')
url='https://doc.kaitai.io/serialization.html'
license=('GPL3')
depends=('java-runtime')
makedepends=('git' 'sbt')
provides=('kaitai-struct-compiler')
conflicts=('kaitai-struct-compiler')
source=("$_pkgname::git+https://github.com/kaitai-io/kaitai_struct_compiler.git#branch=serialization")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Build the kaitai-compiler
  cd "$srcdir/$_pkgname"
  sbt --error compilerJVM/stage
}

package() {
  # Install java jar / classes
  cd "$srcdir/$_pkgname/jvm/target/universal/stage/lib/"
  for f in *.jar; do
    install -D -m 644 "$f" "$pkgdir/usr/share/java/$_pkgname/$f"
  done

  # Install binaries
  install -D -m 755 "$srcdir/$_pkgname/jvm/target/universal/stage/bin/kaitai-struct-compiler" "$pkgdir/usr/bin/kaitai-struct-compiler"

  # Patch kaitai-struct-compiler binary to point to system lib instead of installdir lib
  sed -i "s/^declare -r lib_dir=.*/declare -r lib_dir=\"\/usr\/share\/java\/${_pkgname}\/\"/" "${pkgdir}/usr/bin/kaitai-struct-compiler"

  # Install license
  install -D -m 644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
