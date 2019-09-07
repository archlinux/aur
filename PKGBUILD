# Maintainer: Sebastian Schweizer <sebastian@schweizer.tel>
pkgname=z3-java
pkgver=4.8.5
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
source=("https://github.com/Z3Prover/z3/archive/Z3-$pkgver.tar.gz")
sha256sums=('4e8e232887ddfa643adb6a30dcd3743cb2fa6591735fbd302b49f7028cdc0363')

build() {
  cd "$srcdir/z3-Z3-$pkgver"
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
  cd "$srcdir/z3-Z3-$pkgver/build"
  make install DESTDIR="$pkgdir"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 com.microsoft.z3-sources.jar "$pkgdir/usr/lib/com.microsoft.z3-sources.jar"
}
