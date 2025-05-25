# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="craftworld-toolkit"
pkgdesc="Tools for working with the LittleBigPlanet series"

pkgver=0.1.1
pkgrel=4

arch=(x86_64 aarch64)

url="https://github.com/ennuo/toolkit"
#license=(MIT)

depends=('java-runtime>=17')
makedepends=('java-environment>=17' maven gendesk)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ennuo/toolkit/archive/refs/tags/v${pkgver}.tar.gz" craftworld-toolkit)
md5sums=(4d4aaa0a684229a4c4e183443aaf320a a94b935d56e687c1f57adfe095d7a98a)

prepare() {
	# generate a .desktop file
	gendesk -f -n \
		--pkgname "Craftworld Toolkit" \
		--pkgdesc "${pkgdesc}" \
		--exec craftworld-toolkit \
		--icon craftworld-toolkit.png \
		--categories "Development;Utility"
}

build() {
	# move into the source directory
	cd "toolkit-${pkgver}"

	# build the project
	JAVA_HOME="/usr/lib/jvm/default" mvn package
}

package() {
	# move into the source directory
	cd "toolkit-${pkgver}"

	# copy the main .jar file
	install -Dm644 "toolkit/target/toolkit-${pkgver%.*}.jar" "${pkgdir}/usr/share/java/${pkgname}/toolkit.jar"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 toolkit/src/main/resources/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 '../Craftworld Toolkit.desktop' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# install the script
	install -Dm755 "../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
