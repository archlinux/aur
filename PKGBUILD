# Maintainer: Morgana <morganamilo@gmail.com>

_pkgname=pacmanlogger
_pkgver=0.1.0
pkgname=pacmanlogger-git
pkgver=0.1.0.r5.8ed1065
pkgrel=1
pkgdesc="A scala application that makes reading pacman's logs easier"
arch=('any')
url="https://github.com/carlocastoldi/PacmanLogger"
license=('MIT')
conflicts=('pacmanlogger')
depends=('java-runtime>=8')
makedepends=('sbt' 'java-environment>=8')
provides=('pacmanlogger')
source=("$_pkgname::git+https://github.com/carlocastoldi/PacmanLogger" "pacmanlogger.sh")
md5sums=('SKIP'
         'abe1b34cb77dfd99a1bf726afb689e96')

prepare() {
	cd "$_pkgname"
	mkdir project
	echo 'addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.6")' > project/assembly.sbt
}

build() {
	cd "$_pkgname"
	sbt assembly
}

package() {
	install -Dm755 "pacmanlogger.sh" "$pkgdir/usr/bin/pacmanlogger"

	cd "$_pkgname"
	install -Dm644 "target/scala-2.12/PacmanLogger-assembly-$_pkgver.jar" "$pkgdir/usr/share/scala/$_pkgname/$_pkgname.jar"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

pkgver() {
	cd "$_pkgname"
	printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
