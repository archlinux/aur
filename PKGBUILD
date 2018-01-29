# Maintainer: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=closure-compiler
pkgver=20180101
pkgrel=1
pkgdesc="Performs checking, instrumentation and optimizations on Javascript code."
arch=('any')
url="https://developers.google.com/closure/compiler/"
license=('APACHE')
depends=('java-runtime')
makedepends=('maven' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e7d5f24a9ba38b84294c8acc866a9d4ba0da03f297655d588d33d982cb6133f8')

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
  "$JAVA_HOME/bin/java" -jar /usr/share/java/closure-compiler/closure-compiler.jar $@' > "$pkgdir/usr/bin/closure-compiler"
  chmod +x "$pkgdir/usr/bin/closure-compiler"

  echo '#!/bin/sh
  "$JAVA_HOME/bin/java" -jar /usr/share/java/closure-compiler/closure-compiler-linter.jar $@' > "$pkgdir/usr/bin/closure-compiler-linter"
  chmod +x "$pkgdir/usr/bin/closure-compiler-linter"
}

