# Maintainer: Leonard Janis König < ljrk at ljrk dot org >
_pkgname=joern
pkgname=$_pkgname-git
pkgver=1.1.364
pkgrel=1
epoch=
pkgdesc="The Bug Hunter's Workbench"
arch=('any')
url='https://joern.io/'
license=('apache')
#groups=()
depends=('java-runtime>=11')
makedepends=('sbt' 'java-environment>=11')
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=('git+https://github.com/joernio/joern.git')
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

pkgver() {
	cd "$_pkgname"
	git describe | sed 's/^v//'
}

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	sbt stage
	sbt createDistribution
	sbt querydb/createDistribution
}

check() {
	cd "$_pkgname"
}

package() {
	cd "$_pkgname"
	mkdir -p "$pkgdir/opt/joern"
	unzip -qo -d "$pkgdir/opt/joern" 'target/joern-cli.zip'
	cd "$pkgdir/opt/joern/joern-cli/"
	./joern --remove-plugin querydb
	./joern --add-plugin "$srcdir/$_pkgname/querydb/target/querydb.zip"
}
