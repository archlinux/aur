pkgname=papermc-git
pkgver=1.15.1
pkgrel=1
pkgdesc="High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies"
arch=('any')
url="https://papermc.io/"
license=("custom")
depends=("java-runtime-headless>=8" 'awk')
makedepends=("java-environment>=8" 'git' 'maven')
provides=("paperclip=${pkgver}")
install="paper.install"
source=("$pkgname"::'git+https://github.com/PaperMC/Paper.git#branch=master')
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git submodule update
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s_%s" "$(awk -F: '/minecraftVersion/ {gsub(/"|,|\s/,""); printf $2}' work/BuildData/info.json)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	
	export MAVEN_OPTS="-Xmx2G"

	./paper jar
}

package() {
	install -Dm644 "$srcdir/$pkgname/paperclip.jar" "${pkgdir}/srv/paper/paperclip.${pkgver}.jar"
	install -D "$srcdir/$pkgname/LICENSE.md" "${pkgdir}/srv/paper/LICENSE"
	install -D "$srcdir/$pkgname/licenses/GPL.md" "${pkgdir}/srv/paper/LICENSE_GPL"
	install -D "$srcdir/$pkgname/licenses/MIT.md" "${pkgdir}/srv/paper/LICENSE_MIT"

	ln -s "paperclip.${pkgver}.jar" "${pkgdir}/srv/paper/paperclip.jar"
}


