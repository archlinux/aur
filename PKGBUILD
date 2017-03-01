# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=java-repl-git
pkgver=r452.304c924
pkgrel=1
pkgdesc="Read Eval Print Loop for Java"
arch=('x86_64' 'i686')
url="http://www.javarepl.com/term.html"
license=('apache')
depends=('java-environment>=6')
makedepends=('git' 'gradle')
options=('!strip' '!emptydirs')
source=('javarepl' 'java-repl-git::git+https://github.com/albertlatacz/java-repl')
md5sums=('56204df104d62cd15de230911ca4685a' 'SKIP')

build() {
	cd "$pkgname"
	gradle shadowJar
}

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	mkdir -p "$pkgdir/usr/share/java/java-repl"
	mkdir -p "$pkgdir/usr/bin"

	install -Dm755 javarepl "$pkgdir/usr/bin/javarepl"
	install -Dm644 "$srcdir/$pkgname/build/libs/javarepl-dev.jar" "$pkgdir/usr/share/java/java-repl/"
}
