# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: David Pugnasse <david.pugnasse@gmail.com>

pkgname=pmd
pkgver=6.55.0
pkgrel=1
pkgdesc="Extensible cross-language static code analyzer"
arch=('any')
url="https://github.com/pmd/pmd"
license=('BSD' 'Apache')
depends=('java-runtime>=11')
makedepends=('java-environment>=11' 'maven')
source=("$pkgname-$pkgver.zip::$url/releases/download/pmd_releases%2F$pkgver/pmd-src-$pkgver.zip"
        "pmdapp::https://gitlab.com/-/snippets/2576195/raw/main/pmdapp")
sha256sums=('84f4d5cb62a77cf5ad4f86d71a72439cfd85af8995771cd95d2f80b2a4c752bf'
            'a22dd4eac122346f6abf81be50726e0695a896dcbdc0efaf94afb0d8c270f64d')

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
	local dirs=(pmd{,-bgastviewer,-cpd,-cpdgui,-designer,-designerold})
	for i in "${dirs[@]}"; do
		ln -sv /usr/bin/pmdapp "$pkgdir/usr/bin/$i"
	done
	cd "pmd-src-$pkgver"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
