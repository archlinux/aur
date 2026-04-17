# Maintainer: Leonard Janis König < ljrk at ljrk dot org >
# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
_pkgname=joern
pkgname=$_pkgname-git
pkgver=4.0.523.r2.g4b5afe5
pkgrel=1
epoch=
pkgdesc="The Bug Hunter's Workbench"
arch=('any')
url='https://joern.io/'
license=('Apache-2.0')
groups=('reverse-engineering')
depends=('java-runtime>=19')
makedepends=('git' 'unzip' 'sbt' 'java-environment>=19')
#checkdepends=()
optdepends=(
	'glibc: for csharpsrc2cpg frontend support (C# and .NET)'
	'libgcc: for csharpsrc2cpg frontend support (C# and .NET)'
	'libstdc++: for csharpsrc2cpg frontend support (C# and .NET)'
	'zlib: for csharpsrc2cpg frontend support (C# and .NET)'
)
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=('git+https://github.com/joernio/joern.git')
#noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
