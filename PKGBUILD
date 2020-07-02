# Maintainer: piegames <aur@piegames.de>
pkgname=blockmap-git
pkgver=2.0.0.r11.6eab338
pkgrel=1
pkgdesc="Minecraft map viewer/renderer"
arch=('any')
url="https://github.com/Minecraft-Technik-Wiki/BlockMap"
license=('MIT')
depends=('java-runtime>=12' 'hicolor-icon-theme' 'archlinux-java-run' 'sh')
makedepends=('java-environment>=12' 'git')
source=("${pkgname}"::'git+https://github.com/Minecraft-Technik-Wiki/BlockMap'
		"blockmap.sh"
		"blockmap-gui.sh"
		"BlockMap.desktop")
sha512sums=('SKIP'
            '12f074b279ae23d65ff4d4800592c6dcbfd7708cfb164a78f2c0aa3693776e167e9e43606eaf819d503cc5ec9ae016e48d0e3adc7c4755cf413ea6f810345971'
            '23697d4722300f5ecf9b229f468c4f4fa65f83319df329148d74e66a34ed4f57fdbcd429e91853f898fb2692bdc8ba8a74e0b4776713b59b81b963a0bb1d580a'
            'ae3d4a6ef7593ba7744dd3e08f2fa6ffe96fd2ec670722bf42710c6a77d2223321c09cafb003adc36924dc997756650caf110a3145ee598ee3f27b56610091f5')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname}"
	
	# Taken from the JabRef AUR package
	mkdir -p ${srcdir}/gradle
	export GRADLE_USER_HOME=${srcdir}/gradle
	export JAVA_HOME=$(archlinux-java-run -a 13 -f jdk -j)
	echo "Using JDK from $JAVA_HOME to build BlockMap."
	
	# This *must* be in separate commands
	./gradlew --no-daemon clean
	./gradlew --no-daemon generateData
	./gradlew --no-daemon jar
	./gradlew --no-daemon copyLibs
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
