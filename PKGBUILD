# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=jplag
pkgver=r46.23f14a4
pkgrel=1
pkgdesc="JPlag - Detecting Software Plagiarism"
arch=('any')
url="http://www.jplag.de"
license=('GPL3')
depends=('java-runtime')
makedepends=('git' 'maven')

source=(
  'git://github.com/jplag/jplag.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd jplag

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd jplag/jplag

  mvn clean generate-sources assembly:assembly
}

package() {
  cd jplag/jplag

  install -D -m755 target/jplag-*-jar-with-dependencies.jar $pkgdir/usr/share/java/jplag/jplag.jar
  install -d -m755 $pkgdir/usr/bin
  cat << 'EOF' > $pkgdir/usr/bin/jplag
#!/bin/sh
"$JAVA_HOME/bin/java" -jar /usr/share/java/jplag/jplag.jar $@
EOF
  chmod 755 $pkgdir/usr/bin/jplag
}
