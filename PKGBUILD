# Maintainer: piegames <aur@piegames.de>
pkgname=blockmap-git
pkgver=1.6.2.r0.368749a
pkgrel=1
pkgdesc="Minecraft map viewer/renderer"
arch=('any')
url="https://github.com/Minecraft-Technik-Wiki/BlockMap"
license=('MIT')
depends=('java-runtime>=12' 'hicolor-icon-theme' 'sh')
makedepends=('java-environment>=12' 'git')
source=("${pkgname}"::'git+https://github.com/Minecraft-Technik-Wiki/BlockMap'
		"blockmap.sh"
		"blockmap-gui.sh"
		"BlockMap.desktop")
sha512sums=('SKIP'
            '1665632cde2c12a74584986e95426263e40ccd9e866151869d6fe101f46e8d44b0db666ab7a38407491c27a0dbe9a2a1352da416193486fdbd77519e3498a33c'
            '99510cb7bc43e8a13b49df00012c9d579c0ecf1348c0ff34c9a1ca51e1be46d5bf78d3d5a87c23b77a1b477d93f492c0daa230f0bcf749495361a1882b0ccfba'
            'ae3d4a6ef7593ba7744dd3e08f2fa6ffe96fd2ec670722bf42710c6a77d2223321c09cafb003adc36924dc997756650caf110a3145ee598ee3f27b56610091f5')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname}"
	# This *must* be in separate commands
	./gradlew clean
	./gradlew generateData
	./gradlew jar
	./gradlew copyLibs
}

package() {
	cd "$srcdir"
	
	# Install Arch-Linux specific files
	install -Dm755 'blockmap.sh'                                    "$pkgdir/usr/bin/blockmap"
	install -Dm755 'blockmap-gui.sh'                                "$pkgdir/usr/bin/blockmap-gui"
	install -Dm644 'BlockMap.desktop'                               "$pkgdir/usr/share/applications/BlockMap.desktop"

	cd "${pkgname}"
	
	# Install the license
	install -Dm644 'LICENSE'                                        "$pkgdir/usr/share/licenses/${pkgname}/license.txt"
	
	# Install the icon
	icon_sizes=(16 22 32 48 64 128 256 512 1024)
	for s in "${icon_sizes[@]}"; do
		install -Dm644 "icon/blockmap-${s}.png"                 "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/blockmap.png"
	done
	
	# Install the binaries
	install -Dm644 "BlockMap-cli/build/libs/BlockMap-cli.jar"       "$pkgdir/usr/share/java/blockmap/BlockMap-cli.jar"
	install -Dm644 "BlockMap-gui/build/libs/BlockMap-gui-linux.jar" "$pkgdir/usr/share/java/blockmap/BlockMap-gui.jar"
	
	cd "build/libs/"

	# Install all the dependencies
	for name in *.jar ; do
		install -Dm644 "${name}"                                "$pkgdir/usr/share/java/blockmap/${name}"
	done
}
