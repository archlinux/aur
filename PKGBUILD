# Maintainer: tuxayo < victor (replace by @) tuxayo DOT net >
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: fnord0 < fnord0 AT riseup DOT net >
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: tuxayo < victor (replace by @) tuxayo DOT net >
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=webgoat
pkgver=7.1
pkgrel=1
pkgdesc='Deliberately insecure J2EE web application designed to teach web application security concepts'
arch=('i686' 'x86_64')
url='https://github.com/WebGoat/WebGoat'
license=('GPL2')
depends=('java-runtime')
makedepends=('maven' 'git')
optdepends=('webscarab: proxy for analyzing applications that communicate using the HTTP and HTTPS protocols, used to help solve most WebGoat lessons'
            'paros: MitM HTTP/HTTPS proxy, spider, XSS and injection scanner + more, used to help solve WebGoat lessons')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WebGoat/WebGoat/archive/${pkgver}.tar.gz"
        "webgoat.sh"
        "git+https://github.com/WebGoat/WebGoat-Lessons.git")
sha256sums=('bbf5c3abbc43a7e7f5bcc01af5ab5969a9a063c0f630c82606398e5ec71a8d9e'
            '3615a09c64eb07709bede9b22782bedeffe7c7097cde1c6bcc2a07adcd28712c'
            'SKIP')
install="$pkgname.install"

prepare() {
  cd "$srcdir/WebGoat-Lessons"
  git checkout master

  sed -i 's/7.1-SNAPSHOT/7.0.1/g' "$srcdir/WebGoat-Lessons/pom.xml"

  # Needed to fix issues with maven
  echo "<settings><localRepository>$srcdir</localRepository></settings>" > "$srcdir/maven-settings.xml"
}

build() {
  cd "$srcdir/WebGoat-Lessons"
  mvn package
  cp target/plugins/*.jar "$srcdir/WebGoat-$pkgver/webgoat-container/src/main/webapp/plugin_lessons/"

  cd "$srcdir/WebGoat-$pkgver"
  mvn package
}

package() {
  cd "$srcdir/WebGoat-$pkgver"
  install -Dm755 ../webgoat.sh "$pkgdir/usr/bin/webgoat"
  install -d "$pkgdir/opt/$pkgname"
  install -Dm644 "webgoat-container/target/webgoat-container-$pkgver-war-exec.jar" "$pkgdir/opt/$pkgname/webgoat.jar"
}
