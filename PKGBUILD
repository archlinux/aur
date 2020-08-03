# Maintainer: piegames <aur@piegames.de>
pkgname=blockmap-git
pkgver=2.2.0.r0.db49965
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
            '4b311ac92be3984eca9457f72c0fd87327532b063d5d6bdf38fec683ed2f14fd3dd252f7441e3b15429dcfe7618715da2c2c88adb9ef5b7be85b56d2b7aab35b'
            '5915722b07aba215978ab13531e672f54fc26ebb27cc82fbd8c6103b2ba28c7a1829128dbad31e1682525e78812a8d472d92a66653a4f2d49d7fc5b2ac175bb5'
            '260855d885b219c343e162feb77aff96c340ea2582d1d58a4fc06a1c1a1c7b099c6a2f0bad59fda0fc0dbac7aecbb245f0650d4e1f299b14d81766f22b906902')

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
