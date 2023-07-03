pkgname=papermc-git
pkgver=1.20.1.r7924.4356758
pkgrel=1
pkgdesc="Next generation of Minecraft server, compatible with Spigot plugins and offering uncompromising performance, built from the latest sources upstream"
arch=('any')
url="https://papermc.io/"
license=("custom")
depends=("java-runtime-headless>=17" 'awk')
makedepends=("java-environment>=17" 'git' 'maven')
provides=("papermc=${pkgver}")
install="paper.install"
source=("$pkgname"::'git+https://github.com/PaperMC/Paper.git#branch=master')
md5sums=('SKIP')

_server_root="/srv/papermc"

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git submodule update
}

pkgver() {
	cd "$srcdir/$pkgname"
	#printf "%s.r%s.%s" "$(awk -F: '/minecraftVersion/ {gsub(/"|,|\s/,""); printf $2}' work/BuildData/info.json)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	printf "%s.r%s.%s" "$(awk -F= '/^mcVersion/ {gsub(/"|,|\s/,""); printf $2}' gradle.properties)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	
	export MAVEN_OPTS="-Xmx2G"

	./gradlew applyPatches
	./gradlew createReobfBundlerJar
}

package() {
	_bundlerver="$(awk -F= '/^version/ {gsub(/"|,|\s/,""); printf $2}' $srcdir/$pkgname/gradle.properties)"
	
	install -Dm644 "$srcdir/$pkgname/build/libs/paper-bundler-${_bundlerver}-reobf.jar" "${pkgdir}${_server_root}/papermc.${pkgver}.jar"
	install -D "$srcdir/$pkgname/LICENSE.md" "${pkgdir}${_server_root}/LICENSE"
	install -D "$srcdir/$pkgname/licenses/GPL.md" "${pkgdir}${_server_root}/LICENSE_GPL"
	install -D "$srcdir/$pkgname/licenses/MIT.md" "${pkgdir}${_server_root}/LICENSE_MIT"

	ln -s "papermc.${pkgver}.jar" "${pkgdir}${_server_root}/papermc_server.jar"
}


