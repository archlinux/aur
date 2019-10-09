# Maintainer: Sebastian Schweizer <sebastian@schweizer.tel>
pkgname=z3-java
pkgver=4.8.6
pkgrel=1
pkgdesc="A high-performance theorem prover (with java bindings)"
arch=('i686' 'x86_64')
url="https://github.com/Z3Prover/z3"
license=('MIT')
depends=('gcc-libs')
makedepends=('python' 'java-environment')
optdepends=('java-runtime: bindings for java')
provides=("z3=$pkgver")
conflicts=('z3')
source=("https://github.com/Z3Prover/z3/archive/z3-$pkgver.tar.gz")
sha256sums=('37922fa5085170cad6504498d9758fb63c61d5cb5b68689c11a6c5e84f0311b3')

build() {
  cd "$srcdir/z3-z3-$pkgver"
  python scripts/mk_make.py --java
  cd build
  make

  # Create a *-sources.jar
  mkdir -p java-sources-for-jar/com/microsoft/z3
  cp -r ../src/api/java/. java-sources-for-jar/com/microsoft/z3/
  find java-sources-for-jar -type f -not -name '*.java' -delete
  jar cf com.microsoft.z3-sources.jar -C java-sources-for-jar .
  rm -r java-sources-for-jar
}

package() {
  cd "$srcdir/z3-z3-$pkgver/build"
  make install DESTDIR="$pkgdir"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 com.microsoft.z3-sources.jar "$pkgdir/usr/lib/com.microsoft.z3-sources.jar"
}
