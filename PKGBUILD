# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas P. <tpxp@live.fr>
pkgname=glowing-bear-git
pkgver=v0.6.0.r248.gd87a2cd
pkgrel=1
pkgdesc="A web client for Weechat (Electron version)"
arch=(x86_64 i686)
url="http://www.glowing-bear.org/"
license=('GPL-3.0')
groups=(irc weechat)
depends=(electron)
makedepends=(npm git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/glowing-bear/glowing-bear.git"
        "glowing-bear.desktop")
noextract=()
sha256sums=("SKIP"
            "715aa2fc3c39d8079bbf37c97f6f8a74c4cca41a6cab61726660dc6d0ed46fd6")
validpgpkeys=()

prepare() {
	# Install the dependencies
	cd "glowing-bear"
	npm install
}

pkgver() {
	cd "glowing-bear"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "glowing-bear"
	npm run build-electron-linux
}

check() {
	cd "glowing-bear"
	./run_tests.sh
}

package() {
	# Copy the app to usr/lib/glowing-bear
	cd "$pkgdir"
	mkdir -p usr/lib/glowing-bear

	cd "$srcdir"
	cd "glowing-bear"
	cd Glowing\ Bear-linux-* 
	cp * -R "$pkgdir/usr/lib/glowing-bear"

	# Register the binary as glowing-bear
	cd "$pkgdir"
	mkdir -p usr/bin
	cd usr/bin
	ln -s ../lib/glowing-bear/Glowing\ Bear glowing-bear
	
	# Add the scalable icon
	cd "$pkgdir"
	mkdir -p usr/share/icons/hicolor/scalable/apps
	cd usr/share/icons/hicolor/scalable/apps
	ln -s ../../../../../lib/glowing-bear/resources/app/assets/img/glowing-bear.svg glowing-bear.svg
	
	# Add the 128x128 icon
	cd "$pkgdir"
	mkdir -p usr/share/icons/hicolor/128x128/apps
	cd usr/share/icons/hicolor/128x128/apps
	ln -s ../../../../../lib/glowing-bear/resources/app/assets/img/glowing_bear-128x128.png glowing-bear.png

	# Add the .desktop file
	cd "$pkgdir"
	mkdir -p usr/share/applications
	cp "$srcdir/glowing-bear.desktop" usr/share/applications/

	# FIX: Create the init.json file and make it writeable by anyone
	# This avoids an error popup when quitting GlowingBear
	cd "$pkgdir"
	touch usr/lib/glowing-bear/resources/app/init.json
	chmod 777 usr/lib/glowing-bear/resources/app/init.json
}
