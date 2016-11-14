# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>
pkgname=universal-gcode-sender-git
pkgver=1.0.9.r762.g72d0c9d
pkgrel=2
pkgdesc="Java based GRBL compatible cross-platform G-Code sender"
arch=('any')
url="https://github.com/winder/Universal-G-Code-Sender"
license=('GPL3')
depends=('java-environment>=8' 'sh')
makedepends=('maven')
conflicts=('universal-gcode-sender')
install=universal-gcode-sender-git.install
source=(
  "$pkgname::git+https://github.com/winder/Universal-G-Code-Sender.git"
  "universal-gcode-sender.sh"
)
md5sums=('SKIP'
         'c702750108e124a773dee03bc37934bb')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$pkgname
  mvn package -DskipTests
}

check() {
  cd $srcdir/$pkgname
  mvn test
}

package() {
  cd $srcdir
  install -Dm 755 universal-gcode-sender.sh -T $pkgdir/usr/bin/ugs
  cd $pkgname
  install -Dm 644 ugs-core/target/UniversalGcodeSender.jar \
               -t $pkgdir/usr/share/java
}
