# Maintainer: AppleBloom
pkgname_=fimpp
pkgname=$pkgname_-git
pkgver=r15.61c4103
pkgrel=1
pkgdesc='Interpreter for FIM++, an esoteric programming language inspired by the TV show My Little Pony: Friendship is Magic.'
arch=('any')
url='https://github.com/KarolS/fimpp'
license=('GPL3')
depends=('scala' 'java-runtime')
makedepends=('git') 
source=('git://github.com/KarolS/fimpp.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname_"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname_/bin"
  echo "#!/bin/sh" > fimpp
  echo "java -cp \"/usr/share/scala/lib/scala-library.jar:/usr/share/fimpp/fimpp.jar\"\
 stasiak.karol.fimpp.Main \"\$@\"" >> fimpp
  # Make the messages go to stderr.
  sed -i "s/println/Console.err.println/" "../src/stasiak/karol/fimpp/Main.scala"
}

build() {
  cd "$srcdir/$pkgname_"
  make
}

package() {
  cd "$srcdir/$pkgname_"
  install -Dm644 "bin/fimpp.jar" "$pkgdir/usr/share/fimpp/fimpp.jar"
  install -Dm755 "bin/fimpp" "$pkgdir/usr/bin/fimpp"
  mkdir -p "$pkgdir/usr/share/doc/fimpp"
  cp "LICENSE" "README.md" "grammar/bnf.pdf" "$pkgdir/usr/share/doc/fimpp"
  cp -r "syntax" "$pkgdir/usr/share/doc/fimpp"
  cp -r "examples" "$pkgdir/usr/share/doc/fimpp"
}
