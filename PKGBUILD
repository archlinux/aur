pkgname=papermc
pkgver=1.14.3_0d079188
pkgrel=2
pkgdesc="High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies"
arch=('any')
url="https://papermc.io/"
license=("GPL3")
depends=("java-runtime-headless>=8" 'awk')
makedepends=("java-environment>=8" 'git' 'maven')
provides=("paperclip=${pkgver}")
install="paper.install"
source=("$pkgname"::'git+https://github.com/PaperMC/Paper.git#branch=ver/1.14')
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git submodule update
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s_%s" "$(awk -F: '/minecraftVersion/ {gsub(/\"|,|\s/,""); printf $2}' work/BuildData/info.json)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	./paper jar
}

package() {
	install -Dm644 "$srcdir/$pkgname/paperclip.jar" "${pkgdir}/srv/paper/paperclip.${pkgver}.jar"
	ln -s "paperclip.${pkgver}.jar" "${pkgdir}/srv/paper/paperclip.jar"
}


