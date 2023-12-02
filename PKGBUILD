# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname="sklauncher-bin"
pkgdesc="Secure and modern Minecraft Launcher"

pkgver=3.2.1
pkgrel=1

arch=(i686 x86_64)

url="https://skmedix.pl"
license=("Apache-2.0")

depends=("java-runtime>=17")
makedepends=(unzip gendesk)

provides=(sklauncher)
conflicts=(sklauncher sklauncher-git)

source=("https://skmedix.pl/binaries/_/SKlauncher-${pkgver}.jar" "sklauncher")
md5sums=("b1ec730355259be5113d53b644f48ab1" "3fbda136409cd254ce125839e59ae1c1")

noextract=("SKlauncher-${pkgver}.jar")

prepare() {
	# extract the logo out of the JAR file
	unzip -o -j "SKlauncher-${pkgver}.jar" logo.png -d .

	# generate a .desktop file
	gendesk -f -n \
		--pkgname SKlauncher \
		--pkgdesc "${pkgdesc}" \
		--exec sklauncher \
		--icon SKlauncher.png \
		--categories "Game;Simulation"
}

package() {
	# copy the launcher .jar file
	install -Dm755 "SKlauncher-${pkgver}.jar" "${pkgdir}/usr/share/java/sklauncher/SKlauncher.jar"

	# copy the executable script
	install -Dm755 sklauncher "${pkgdir}/usr/bin/sklauncher"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/SKlauncher.png"
	install -Dm644 SKlauncher.desktop "${pkgdir}/usr/share/applications/SKlauncher.desktop"
}