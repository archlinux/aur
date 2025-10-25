# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
pkgname=jd-gui-duo
pkgver=2.0.96
pkgrel=1
pkgdesc="A 2-in-1 JAVA decompiler based on JD-CORE v0 and v1"
arch=('any')
url="https://github.com/nbauma109/$pkgname"
license=('GPL3')
depends=('java-runtime>=21')
makedepends=('maven' 'jdk21-openjdk')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/nbauma109/$pkgname/archive/refs/tags/$pkgver.tar.gz"
	"jd-gui-duo"
	"jd-gui-duo.desktop"
	"assembler_pom.patch"
)
sha256sums=('fd1685edc4f536ae411f068720bdcab17a81de77af06159a76e8aeb4f5c590fd'
            '9d175e28662dd1ad701f76d5aa7f7752543453f156615b96787e641252ce60e4'
            'd40a09c9c228b55dcb54823b878cd180521386a11abffed478ce89439fd4e184'
            'd8e107f28224057cb282a5f0f31fb5059eb343708feb18c95b8cffb6629728ef')

build() {
	patch "$pkgname-$pkgver/assembler/pom.xml" < "assembler_pom.patch"
	cd "$pkgname-$pkgver"
	JAVA_HOME="/usr/lib/jvm/java-21-openjdk" mvn clean package --no-transfer-progress
}

package() {
	install -d "$pkgdir/usr/share/java/$pkgname"
	cp -r "$srcdir/$pkgname-$pkgver/assembler/target/lib" "$pkgdir/usr/share/java/$pkgname"
	install -Dm755 "jd-gui-duo" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "jd-gui-duo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname-$pkgver/src/linux/resources/jd_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
