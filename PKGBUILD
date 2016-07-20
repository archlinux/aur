# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=nightcode-git

pkgver=2.0.1.r6.g5340984
pkgrel=1
pkgdesc='A Editor/IDE described as "The only thing you need to create Clojure and Java projects"'
arch=('any')
url="https://sekao.net/nightcode/"
license=('custom')
depends=('bash' 'java-runtime>7' 'java-openjfx')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

source=('nightcode-git::git+http://github.com/oakes/Nightcode.git'
        'https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh')

md5sums=('SKIP' 'SKIP')
noextract=('boot.sh')

build() {
  cd $srcdir/$pkgname
  msg2 "compiling and building uberjar - this may take some time"
  bash $srcdir/../boot.sh build
}

package() {
  JARNAME="nightcode-standalone.jar"

  #artifact
  mkdir -p "$pkgdir/usr/share/java/nightcode-git/"
  cp $srcdir/$pkgname/target/project.jar "$pkgdir/usr/share/java/$pkgname/$JARNAME"
  
  #license
  mkdir -p "$pkgdir/usr/share/licenses/nightcode-git/"
  cp $srcdir/$pkgname/UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  
  #launcher
  mkdir -p "$pkgdir/usr/bin/"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nightcode-git"
  echo 'java -Xmx512m -jar /usr/share/java/nightcode-git/'$JARNAME' $@' >> "$pkgdir/usr/bin/nightcode-git"
  chmod +x "$pkgdir/usr/bin/nightcode-git"
}

