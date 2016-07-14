# Maintainer: Patrik Plihal <patrik.plihal at gmail dot com>

pkgname=nightcode-git

pkgver=2.0.0
pkgrel=3
pkgdesc='A Editor/IDE described as "The only thing you need to create Clojure and Java projects"'
arch=('any')
url="https://sekao.net/nightcode/"
license=('custom')
depends=('bash' 'java-runtime>7')

pkgver() {
  cd $srcdir/Nightcode-master
  bash $startdir/boot.sh pom
  cat target/META-INF/maven/nightcode/nightcode/pom.properties | grep version | cut -d= -f2
}

source=('https://github.com/oakes/nightcode/archive/master.zip'
        'https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh')

md5sums=('SKIP' 'SKIP')

noextract=('boot.sh')

build() {
  cd $srcdir/Nightcode-master
  msg2 "compiling and building uberjar - this may take some time"
  bash $startdir/boot.sh build
}

package() {
  JARNAME="nightcode-"$pkgver"-standalone.jar"

  #artifact
  mkdir -p "$pkgdir/usr/share/java/nightcode-git/"
  cp $srcdir/Nightcode-master/target/project.jar "$pkgdir/usr/share/java/nightcode-git/$JARNAME"
  
  #license
  mkdir -p "$pkgdir/usr/share/licenses/nightcode-git/"
  cp $srcdir/Nightcode-master/UNLICENSE "$pkgdir/usr/share/licenses/nightcode-git/"
  
  #launcher
  mkdir -p "$pkgdir/usr/bin/"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nightcode-git"
  echo 'java -Xmx512m -jar /usr/share/java/nightcode-git/'$JARNAME' $@' >> "$pkgdir/usr/bin/nightcode-git"
  chmod +x "$pkgdir/usr/bin/nightcode-git"
}

