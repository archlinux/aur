# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: David Pugnasse <david.pugnasse@gmail.com>

pkgname=pmd
pkgver=6.51.0
pkgrel=1
pkgdesc="Extensible cross-language static code analyzer"
arch=('any')
url="https://github.com/pmd/pmd"
license=('BSD' 'Apache')
depends=('java-runtime>=7')
makedepends=('java-environment>=11' 'maven')
source=("$pkgname-$pkgver.zip::$url/releases/download/pmd_releases%2F$pkgver/pmd-src-$pkgver.zip"
        pmdapp)
sha256sums=('007990bec5ca9780dacc8adb30b58e8b8441de4f822b60c3533da1002cefab78'
            '047ea25735c7fabb75679889652d82e3a557c8df8d87380045c5cd3eb5f5b02e')

prepare() {
	cd "pmd-src-$pkgver"
	JAVA_HOME=/usr/lib/jvm/default mvn dependency:go-offline
}

build() {
	cd "pmd-src-$pkgver"
	JAVA_HOME=/usr/lib/jvm/default mvn install -Dmaven.test.skip=true
	mkdir -p "$srcdir/build"
	bsdtar -xf "pmd-dist/target/pmd-bin-$pkgver.zip" -C "$srcdir/build" --strip-components 1 "pmd-bin-$pkgver/lib"
}

package() {
	install -Dvm644 build/lib/*.jar -t "$pkgdir/usr/share/java/$pkgname/"
	install -Dv pmdapp -t "$pkgdir/usr/bin/"
	for i in pmd-bgastviewer pmd-cpd pmd-cpdgui pmd-designer pmd-designerold pmd; do
		ln -sv /usr/bin/pmdapp "$pkgdir/usr/bin/$i"
	done
	cd "pmd-src-$pkgver"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
