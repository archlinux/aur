# Maintainer: Patrik Plihal <patrik.plihal@gmail.com>

pkgname=nightcode-git

pkgver=0.4.7.SNAPSHOT
pkgrel=1
pkgdesc='A Editor/IDE described as "The only thing you need to create Clojure and Java projects"'
arch=('any')
url="https://sekao.net/nightcode/"
license=('custom')
depends=('bash' 'java-runtime>6')
makedepends=('leiningen' 'git')

pkgver() {
  # process version number as defined in project.clj (defproject nightcode "0.4.2-SNAPSHOT" ...
  cd $srcdir/Nightcode-master
  lein update-in :plugins conj '[lein-pprint "1.1.2"]' -- pprint :version | sed 's/"//g' | sed "s/-/./g"
}

source=('https://github.com/oakes/nightcode/archive/master.zip')
md5sums=('SKIP')

build() {
  cd $srcdir/Nightcode-master
  lein clean
  msg2 "fullfilling dependencies [maven]"
  lein deps
  msg2 "compiling and building uberjar - this may take some time"
  LEIN_SNAPSHOTS_IN_RELEASE=1 lein uberjar
}

package() {
  JARNAME="nightcode-"$pkgver"-standalone.jar"

  #artifact
  mkdir -p "$pkgdir/usr/share/java/nightcode-git/"
  cp $srcdir/Nightcode-master/target/nightcode*-standalone.jar "$pkgdir/usr/share/java/nightcode-git/$JARNAME"
  
  #license
  mkdir -p "$pkgdir/usr/share/licenses/nightcode-git/"
  cp $srcdir/Nightcode-master/UNLICENSE "$pkgdir/usr/share/licenses/nightcode-git/"
  
  #launcher
  mkdir -p "$pkgdir/usr/bin/"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nightcode-git"
  echo 'java -Xmx512m -jar /usr/share/java/nightcode-git/'$JARNAME' $@' >> "$pkgdir/usr/bin/nightcode-git"
  chmod +x "$pkgdir/usr/bin/nightcode-git"
}

