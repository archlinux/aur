# Maintainer: Stick <stick at stma dot is>
# Contributor: Frederik "Freso" S. Olesen <archlinux at freso dot dk>
# Contributor: CubeTheThird <cubethethird at gmail dot com>
# shellcheck disable=2034,2154

_pkg=amidst
pkgname="$_pkg-git"
pkgver=4.3.beta5.r18.g15953d62
pkgrel=2
pkgdesc='Advanced Minecraft Interface and Data/Structure Tracking'
arch=('any')
url='https://github.com/toolbox4minecraft/amidst'
license=('GPL3')
depends=('java-runtime>=8')
makedepends=('git' 'maven')
optdepends=('minecraft: the game itself')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$pkgname::git+$url"
        icon.png)
sha256sums=('SKIP'
            '30622fc7576475efe3c63675f2b33d29177091040d29fb7db031ec229e79be39')

pkgver() {
	cd "$pkgname" || exit
	local _ver
	_ver="$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
	printf '%s\n' "${_ver#v}"
}

build() {
	cd "$srcdir" || exit

	# Create shell script to launch the application
	echo "#!/bin/sh" > amidst.sh
	echo "java -jar /usr/share/java/$_pkg/AMIDST.jar" >> amidst.sh

	# Create .desktop file
	{
		echo '[Desktop Entry]'
		echo 'Type=Application'
		echo "Version=$pkgver"
		cat <<- EOF
			Name=AMIDST
			Comment=Advanced Minecraft Interface and Data/Structure Tracking
			TryExec=amidst
			Exec=java -jar /usr/share/java/amidst/AMIDST.jar
			Icon=/usr/share/pixmaps/amidst.png
			Terminal=false
			Categories=Game;
			Keywords=minecraft;
			EOF
	} > amidst.desktop

	# Build the .jar using maven
	cd "$pkgname" || exit
	mvn clean
	mvn package
}

package() {
	local _basever="${pkgver%%.r*}"
	local _jarver="v${_basever/.beta/-beta}"

	cd "$srcdir" || exit

	install -vDm755 'amidst.sh' "$pkgdir/usr/bin/amidst"
	install -vDm644 'icon.png' "$pkgdir/usr/share/pixmaps/amidst.png"
	install -vDm644 'amidst.desktop' "$pkgdir/usr/share/applications/amidst.desktop"
	install -vDm644 "$pkgname/target/$_pkg-${_jarver/./-}.jar" \
		"$pkgdir/usr/share/java/$_pkg/AMIDST.jar"
}
