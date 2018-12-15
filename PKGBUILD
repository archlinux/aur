# Maintainer: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=closure-compiler
pkgver=20181210
pkgrel=1
pkgdesc="Performs checking, instrumentation and optimizations on Javascript code."
arch=('any')
url="https://developers.google.com/closure/compiler/"
license=('APACHE')
depends=('java-runtime=8')
makedepends=('maven' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('54da6f1983e7d3a523e8352ab5749113f33dae64a3df8d08c4db3eb5a13d6bcdd9b9a9850279dc168ed63a15ac5150c9bcd5a8642ff7090a058b9b18ade4d024')

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

