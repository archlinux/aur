# Maintainer: Gelaechter <gelaechter at pommer dot info>
pkgname=verinice
pkgver=1.28.0
pkgrel=2
pkgdesc="Die moderne Open-Source GRC-Software"
arch=("x86_64")
url="https://github.com/SerNet/verinice"
license=("Apache-2.0")
depends=("java-runtime>=17")
makedepends=("git")
source=(
	"${pkgname}::git+https://github.com/SerNet/verinice.git#tag=${pkgver}"
	"${pkgname}.desktop"
)
sha256sums=('3ceffa78d248d393590cf18bbb557d0d82e1f23f68503d3749a3da09d6e82d60'
            '95a1ea6e9eebb12d34705c8ad2f60023d0b4b1e7f34be02b13052c78659e54c3')

build() {
	cd "${srcdir}/verinice"
	echo "Starting build..."
	# Adjust JAXP limit (https://aur.archlinux.org/packages/verinice#comment-1033537)
	export MAVEN_OPTS="-Djdk.xml.maxGeneralEntitySizeLimit=0 -Djdk.xml.totalEntitySizeLimit=0"
	./mvnw -Dtycho.disableP2Mirrors=true -DskipTests verify
}

package() {
	artifact="${srcdir}/verinice/sernet.verinice.releng.client.product/target/products/sernet.verinice.releng.client/linux/gtk/${CARCH}/verinice/"
	icons="${srcdir}/verinice/sernet.verinice.releng.client.product/verinice_icons"

	# Icons
	install -Dm 644 "${icons}/v-16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
	install -Dm 644 "${icons}/v-32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
	install -Dm 644 "${icons}/v-48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
	install -Dm 644 "${icons}/v-64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
	install -Dm 644 "${icons}/v-128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
	# Appdir and symlink
	install -dm 755 "$pkgdir"/{opt,usr/bin}
	cp -r "${artifact}/." "${pkgdir}/opt/${pkgname}/"
	ln -s "/opt/${pkgname}/verinice" "${pkgdir}/usr/bin/verinice"
	# Desktop entry
	install -Dm 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
