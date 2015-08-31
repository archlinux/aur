# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: fnord0 < fnord0 AT riseup DOT net >
pkgname=webgoat
pkgver=6.0.1
pkgrel=3
pkgdesc='Deliberately insecure J2EE web application designed to teach web application security concepts'
arch=('i686' 'x86_64')
url='https://webgoat.github.io/'
license=('GPL2')
depends=('java-runtime')
makedepends=('maven')
optdepends=('webscarab: proxy for analyzing applications that communicate using the HTTP and HTTPS protocols, used to help solve most WebGoat lessons'
            'paros: MitM HTTP/HTTPS proxy, spider, XSS and injection scanner + more, used to help solve WebGoat lessons')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WebGoat/WebGoat-Legacy/archive/v${pkgver}.tar.gz"
        "webgoat.sh")
sha256sums=('21945864691f444824b70222018d43591010603d256f097c12b0885ce3c70779'
            '3615a09c64eb07709bede9b22782bedeffe7c7097cde1c6bcc2a07adcd28712c')
install="$pkgname.install"

build() {
  cd "$srcdir/WebGoat-Legacy-$pkgver"
  # Needed to fix issues with maven
  echo "<settings><localRepository>$srcdir</localRepository></settings>" > "$srcdir/maven-settings.xml"
  mvn -s $srcdir/maven-settings.xml clean package
}

package() {
  cd "$srcdir/WebGoat-Legacy-$pkgver"
  install -Dm755 ../webgoat.sh "$pkgdir/usr/bin/webgoat"
  install -d "$pkgdir/opt/$pkgname"
  cp -r doc "$pkgdir/opt/$pkgname/doc"
  install -Dm644 "target/WebGoat-$pkgver-war-exec.jar" "$pkgdir/opt/$pkgname/webgoat.jar"
}
