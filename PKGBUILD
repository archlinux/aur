# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=jerry
pkgver=4.2.1
pkgrel=1
pkgdesc="A chess analysis GUI"
arch=(any)
url=https://github.com/asdfjkl/jerry
license=(GPL)
depends=(java-runtime stockfish)
makedepends=(maven)
optdepends=('komodo-engine: alternative engine (Mode -> Engines -> Add)'
            'critter-engine: alternative engine (Mode -> Engines -> Add)'
            'lazygull-engine-git: alternative engine (Mode -> Engines -> Add)')
source=(https://github.com/asdfjkl/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=(888c920b858099a34d05cd8b6b6807731211d3562fe4324a5d9710d8346e254d)

prepare() {
  cd $pkgname-$pkgver
  sed -e 's:stockfishPath =.*:stockfishPath = "/usr/bin/stockfish";:' \
      -i src/main/java/org/asdfjkl/jerryfx/gui/GameModel.java
  sed -e "s:^Icon=.*:Icon=$pkgname.png:" \
      -i snap/gui/$pkgname.desktop
}

build() {
  cd $pkgname-$pkgver
  mvn clean compile assembly:single
}

package() {
  cd $pkgname-$pkgver

  _id=$(grep -oPm1 '(?<=<artifactId>)[^<]+' pom.xml)
  _version=$(grep -oPm1 '(?<=<version>)[^<]+' pom.xml)
  _suffix=$(grep -oPm1 '(?<=<descriptorRef>)[^<]+' pom.xml)
  _extension=$(grep -oPm1 '(?<=<packaging>)[^<]+' pom.xml)
  _target=target/$_id-$_version-$_suffix.$_extension

  echo -e "#!/bin/bash\nexec /usr/bin/java -jar /usr/share/java/$pkgname/$_target \"\$@\"" >$pkgname.sh
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $_target "$pkgdir"/usr/share/java/$pkgname/$_target

  install -Dm644 snap/local/book/varied.bin "$pkgdir"/usr/share/java/$pkgname/book/varied.bin
  install -Dm644 snap/local/splash/splash.png "$pkgdir"/usr/share/java/$pkgname/splash/splash.png
  install -Dm644 snap/gui/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 snap/gui/$pkgname.png "$pkgdir"/usr/share/icons/$pkgname.png
}
