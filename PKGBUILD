# Maintainer: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Alan Jenkins <alan.james.jenkins at gmail dot com>
# Contributor: Maximilian Berger <snowdragon92 at gmail dot com>

pkgname=atlauncher-git
pkgver=3.3.5.2.r650.g813f828e
pkgrel=1
pkgdesc="A Launcher for Minecraft which integrates multiple different ModPacks to allow you to download and install ModPacks easily and quickly."
arch=(any)
url="https://atlauncher.com/"
license=('GPL3')
depends=('java-runtime=8' 'openal' 'sh')
makedepends=('git' 'java-environment=8' 'gradle')
provides=('atlauncher')
conflicts=('atlauncher')

source=("git+https://github.com/ATLauncher/ATLauncher.git"
	"atlauncher"
	"atlauncher.desktop"
	"atlauncher.png"
       )

sha256sums=('SKIP'
            '67fc4f30bf1f33e478f8ce7795094233cb80af99eb8c01bf10eb5e45c3988160'
            'eb9246f20098844f2f4226fbfe0b2d4a4d20c80e4e295b14c23f3857267b12ca'
            '369c7aa4439762878fd9970c75d1312cf0cd97119c8320b732addef4a621482d')

pkgver() {
	cd "$srcdir/ATLauncher"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/ATLauncher"
	gradle build
}

package() {
	cd "$srcdir"

	# create folder for the main jar executable
	mkdir -p "$pkgdir/usr/share/java/atlauncher/"
	chmod -R 755 "$pkgdir/usr/share/java/atlauncher/"

	# create folder for other files
	mkdir -p "$pkgdir/usr/share/atlauncher/Downloads"
	chmod 777 "$pkgdir/usr/share/atlauncher/Downloads"

	# install shell wrapper script
	install -D -m755 "$srcdir/atlauncher" "$pkgdir/usr/bin/atlauncher"

	# install jar
	install -D -m644 "$srcdir/ATLauncher/dist/ATLauncher-$(sed 's/.Beta//' $srcdir/ATLauncher/src/main/resources/version).jar" "$pkgdir/usr/share/java/atlauncher/ATLauncher.jar"

	# install desktop launcher with icon
	install -D -m644 "$srcdir/atlauncher.desktop" "$pkgdir/usr/share/applications/atlauncher.desktop"
	install -D -m644 "$srcdir/atlauncher.png" "$pkgdir/usr/share/pixmaps/atlauncher.png"
}

