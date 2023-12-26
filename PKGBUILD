# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=stags
pkgver=0.5.0
pkgrel=1
pkgdesc="scala tags generator"
arch=(any)
url="https://github.com/pjrt/stags"
license=('MIT')
_java_version=8
_scala_version=2.12
depends=(
	java-runtime=$_java_version
)
makedepends=(
	java-environment=$_java_version
	sbt
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
	"$url/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.sh"
)
sha512sums=('cb0696c098a9b83b523d4a2fcd3ddc7476622e668c8462bbbf671ce6639756be6eaba21692833ee4b3cfc98473a3c0c06b3483341a9a70682a01d403d6baaf91'
            '3e96967cef72893524e69df1879aa60778e54f15bad8530679f223219a46588bcfb05a2fe56d6ebbfd6b1d383ceaba55af409db044dd17ec7621c1152ddb2400')

prepare() {
	sed "s/JAVA_VERSION/$_java_version/" "$pkgname.sh" > "$pkgname-$pkgver/cli/$pkgname"
}

build() {
	cd "$pkgname-$pkgver"

	sbt --batch --java-home "/usr/lib/jvm/java-${_java_version}-openjdk/" cli/assembly
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm644 "cli/target/scala-$_scala_version/$pkgname-$pkgver" \
		"$pkgdir/usr/share/scala/$pkgname/$pkgname.jar"
	install -Dm755 "cli/$pkgname" -t "$pkgdir/usr/bin/"
}
