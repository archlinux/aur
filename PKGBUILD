# Maintainer: js6pak <kubastaron@hotmail.com>

pkgname=betacraft-launcher-git
pkgver=1.09_17.r0.6c6f5d1
pkgrel=1
pkgdesc="A Minecraft launcher that aims to provide easy access to old versions and improve the overall game experience in those versions."
arch=('x86_64')
url="https://github.com/betacraftuk/betacraft-launcher"
license=('GPL3')
depends=('java-runtime=8')
makedepends=('git' 'java-environment>=8')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=('git+https://github.com/betacraftuk/betacraft-launcher.git'
	'betacraft-launcher'
	'betacraft-launcher.desktop')
sha256sums=('SKIP'
            '31bded76e46fd1538fb131fad774d402685b341df861b3f538379d926e5d4d6a'
            '260020b2dcb68c46ec4d13112289d21fdff962df8345918a612d3b3fb0359551')

pkgver() {
	cd "$srcdir/BetaCraft-Launcher-Java"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/BetaCraft-Launcher-Java"
	./gradlew build
}

package() {
	cd "$srcdir/BetaCraft-Launcher-Java"

	mkdir -p "$pkgdir/opt/betacraft-launcher/"
	chmod -R 755 "$pkgdir/opt/betacraft-launcher/"

	install -D -m755 "$srcdir/betacraft-launcher" "$pkgdir/usr/bin/betacraft-launcher"

	install -D -m644 "build/libs/BetaCraft-Launcher-Java.jar" "$pkgdir/opt/betacraft-launcher"

	install -D -m644 "src/main/resources/icons/icon.png" "$pkgdir/usr/share/pixmaps/betacraft-launcher.png"
	install -D -m644 "$srcdir/betacraft-launcher.desktop" "$pkgdir/usr/share/applications/betacraft-launcher.desktop"
}
