# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="craftworld-toolkit"
pkgdesc="Tools for working with the LittleBigPlanet series"

pkgver=0.1.1
pkgrel=2

arch=(x86_64 aarch64)

url="https://github.com/ennuo/toolkit"
#license=("LicenseRef-unknown")

depends=("java-runtime>=17")
makedepends=("java-environment>=17" maven gendesk)

provides=(craftworld-toolkit)

source=("https://github.com/ennuo/toolkit/archive/refs/tags/v${pkgver}.tar.gz" "craftworld-toolkit")
md5sums=("4d4aaa0a684229a4c4e183443aaf320a" "15f05a3a7a19863a7642e05ae5339cf8")

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
	install -Dm644 "toolkit/target/toolkit-${pkgver%.*}.jar" "${pkgdir}/usr/share/java/craftworld-toolkit/toolkit.jar"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 toolkit/src/main/resources/icon.png "${pkgdir}/usr/share/pixmaps/craftworld-toolkit.png"
	install -Dm644 "../Craftworld Toolkit.desktop" "${pkgdir}/usr/share/applications/craftworld-toolkit.desktop"

	# install the script
	install -Dm755 ../craftworld-toolkit "${pkgdir}/usr/bin/craftworld-toolkit"
}
