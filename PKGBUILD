# Maintainer: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=closure-compiler
pkgver=20180402
pkgrel=1
pkgdesc="Performs checking, instrumentation and optimizations on Javascript code."
arch=('any')
url="https://developers.google.com/closure/compiler/"
license=('APACHE')
conflicts=('java-runtime=7')
depends=('java-runtime=8')
makedepends=('maven' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('5076b664f8eb7e9fed9e23884c6eedd7a75f463f4c094580d87375aaa87a698f83beb76688b9a465be0dcdd6388995e577529af5fbb29f4dc10feb1edd619f92')

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

