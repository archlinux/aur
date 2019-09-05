# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=closure-compiler
pkgver=20190618
pkgrel=1
pkgdesc="Performs checking, instrumentation and optimizations on Javascript code."
arch=('any')
url="https://developers.google.com/closure/compiler/"
license=('APACHE')
depends=('java-runtime=8')
makedepends=('maven' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/closure-compiler/archive/v$pkgver.tar.gz")
sha512sums=('b0849af5351b6220fd9c918c402f5c48cc2c61441d573a66b3860c9a9bb3e310608366066987d2011d54bf48b89436c127b3722cf861159dfe7af74f094f4a58')

LANG='en_US.UTF-8'

build() {
  cd "$pkgname-$pkgver"
  mvn -DskipTests
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 target/closure-compiler-1.0-SNAPSHOT.jar "$pkgdir/usr/share/java/closure-compiler/closure-compiler.jar"
  install -Dm644 target/closure-compiler-linter-1.0-SNAPSHOT.jar "$pkgdir/usr/share/java/closure-compiler/closure-compiler-linter.jar"
  install -dm755 $pkgdir/usr/bin

  echo '#!/bin/sh
  PATH="/usr/lib/jvm/java-8-openjdk/bin:$PATH" java -jar /usr/share/java/closure-compiler/closure-compiler.jar $@' > "$pkgdir/usr/bin/closure-compiler"
  chmod +x "$pkgdir/usr/bin/closure-compiler"

  echo '#!/bin/sh
  PATH="/usr/lib/jvm/java-8-openjdk/bin:$PATH" java -jar /usr/share/java/closure-compiler/closure-compiler-linter.jar $@' > "$pkgdir/usr/bin/closure-compiler-linter"
  chmod +x "$pkgdir/usr/bin/closure-compiler-linter"
}

