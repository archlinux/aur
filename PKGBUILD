# Maintainer: Sean Anderson <seanga2@gmail.com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=6.0.0
pkgrel=2
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://www.chisel-lang.org/'
license=('BSD')
_java_version=11
_scala_version=2.13
depends=(
	java-environment=$_java_version
)
optdepends=(
	"verilator: for simulation"
)
makedepends=(
	graphviz
	sbt
)
source=(
	"https://github.com/chipsalliance/chisel/archive/refs/tags/v${pkgver}.tar.gz"
	"chisel.patch"
)
sha256sums=('24edc6c7bf50ffab648eb90d600d50bd572eb9c33177a78242dd7bd9a2521251'
            '77c48cd298c9a0311b26bba156e081560bd50c0bf220beb5d095405eeb5ae894')

prepare() {
	cd $pkgname-$pkgver

	patch -p1 -i "$srcdir/chisel.patch"
	echo "ThisBuild / version := \"$pkgver\"" > version.sbt
}

build() {
	cd ${pkgname}-${pkgver}

	sbt --batch --java-home "/usr/lib/jvm/java-${_java_version}-openjdk/" assembly
}

package() {
	cd ${pkgname}-${pkgver}

	install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname} "${pkgdir}"/usr/share/scala/${pkgname}/
	install -Dm644 target/scala-$_scala_version/${pkgname}-assembly-${pkgver}.jar \
		"${pkgdir}"/usr/share/scala/${pkgname}/${pkgname}.jar
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}
