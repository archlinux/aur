pkgname=papermc-git
pkgver=1.18.1.r6575.29bd57b4c
pkgrel=1
epoch=1
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

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git submodule update
}

pkgver() {
	cd "$srcdir/$pkgname"
	#printf "%s.r%s.%s" "$(awk -F: '/minecraftVersion/ {gsub(/"|,|\s/,""); printf $2}' work/BuildData/info.json)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	printf "%s.r%s.%s" "$(awk -F= '/^mcVersion/ {gsub(/"|,|\s/,""); printf $2}' gradle.properties)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	
	export MAVEN_OPTS="-Xmx2G"

	./gradlew applyPatches
	./gradlew createReobfBundlerJar
}

package() {
	_bundlerver="$(awk -F= '/^version/ {gsub(/"|,|\s/,""); printf $2}' $srcdir/$pkgname/gradle.properties)"
	
	install -Dm644 "$srcdir/$pkgname/build/libs/paper-bundler-${_bundlerver}-reobf.jar" "${pkgdir}/srv/papermc/papermc.${pkgver}.jar"
	install -D "$srcdir/$pkgname/LICENSE.md" "${pkgdir}/srv/papermc/LICENSE"
	install -D "$srcdir/$pkgname/licenses/GPL.md" "${pkgdir}/srv/papermc/LICENSE_GPL"
	install -D "$srcdir/$pkgname/licenses/MIT.md" "${pkgdir}/srv/papermc/LICENSE_MIT"

	ln -s "papermc.${pkgver}.jar" "${pkgdir}/srv/papermc/papermc_server.jar"
}


