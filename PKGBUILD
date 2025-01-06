# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: David Pugnasse <david.pugnasse@gmail.com>

pkgname=pmd
pkgver=7.9.0
pkgrel=2
pkgdesc="Extensible cross-language static code analyzer"
arch=('any')
url="https://github.com/pmd/pmd"
license=('BSD' 'Apache')
depends=('java-runtime>=11')
makedepends=('java-environment>=11' 'maven' 'unzip')
source=("$pkgname-$pkgver.zip::$url/releases/download/pmd_releases%2F$pkgver/pmd-dist-$pkgver-src.zip")
sha256sums=('3d6ab38b1ae2b5ef758f1e48f0f6fa8b9fe5e7d043c0b018dc24c039ecc5eb27')

prepare() {
	cd "pmd-src-$pkgver"
	./mvnw dependency:resolve

	# Disable git commit id
	awk '/<plugin>/ {plugin=0}/<groupId>io.github.git-commit-id<\/groupId>/ {plugin=1}/<configuration>/ && plugin==1 {print; print "<skip>true</skip>"; next}{print}' pmd-core/pom.xml > temp_file.xml && mv temp_file.xml pmd-core/pom.xml
}

build() {
	cd "pmd-src-$pkgver"
	./mvnw clean package -T 1C
}

package() {
    cd "pmd-src-$pkgver/pmd-dist/target"
    unzip pmd-dist-$pkgver-bin.zip

    install -dm755 "$pkgdir/opt/pmd"
    install -dm755 "$pkgdir/usr/bin"
    
    # Install the pmd directory
    install -dm755 "$pkgdir/opt/pmd/pmd-bin-$pkgver"
    cp -a pmd-bin-$pkgver/* "$pkgdir/opt/pmd/pmd-bin-$pkgver/"

    # Create symlinks
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/pmd/pmd-bin-$pkgver/bin/pmd" "$pkgdir/usr/bin/pmd"
    ln -s "/opt/pmd/pmd-bin-$pkgver/bin/pmd" "$pkgdir/usr/bin/pmdapp"
}