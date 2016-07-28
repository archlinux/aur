# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=nightcode
_name=Nightcode
pkgver=2.0.2
pkgrel=1
pkgdesc="A simple IDE for Clojure and ClojureScript."
arch=('any')
url="https://sekao.net/nightcode/"
license=('UNILICENSE')
depends=('java-runtime>7' 'java-openjfx')
conflicts=('nightcode-git')
source=("https://github.com/oakes/Nightcode/archive/$pkgver.tar.gz"
        "https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh"
        "nightcode.desktop")
noextract=('boot.sh')
sha256sums=('be6a2d7263e7d0320a4f05dda3fbdbcef2a85c28493c989cb0d19df5aba182d8'
            '895def8ef37f4b78bb37a26566ce970dc24219e880154a18ef7ade5a778d3a2f'
            'SKIP')

build() {
	cd "$_name-$pkgver"
	msg2 "Building nightcode..."
	bash $srcdir/boot.sh build
}

package() {
  JARNAME="nightcode-standalone.jar"

  #artifact
  mkdir -p "$pkgdir/usr/share/java/nightcode/"
  install -Dm644 "$srcdir/$_name-$pkgver/target/project.jar" "$pkgdir/usr/share/java/$pkgname/$JARNAME"

  #license
  mkdir -p "$pkgdir/usr/share/licenses/nightcode/"
  install -Dm644 $srcdir/$_name-$pkgver/UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/"

  #launcher
  mkdir -p "$pkgdir/usr/bin/"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nightcode"
  echo 'java -Xmx512m -jar /usr/share/java/nightcode/'$JARNAME' $@' >> "$pkgdir/usr/bin/nightcode"
  chmod 755 "$pkgdir/usr/bin/nightcode"

  #icon
  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 $srcdir/nightcode.desktop "$pkgdir/usr/share/applications"
}
