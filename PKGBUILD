# Maintainer: Samuel Sloniker <sam@kj7rrv.com>
# Maintainer: Roy Williams <fang64@gmail.com>

pkgname=hamclock
pkgver=3.04
pkgrel=1
epoch=
pkgdesc="Clock and world map with extra features for amateur radio (800x480 version)"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://clearskyinstitute.com/ham/HamClock"
license=('MIT')
groups=()
depends=('libx11' 'libxcb')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/kj7rrv/hamclock/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('52fefbf6f02e41bddb57faaf8eab87b6c7ecfd91c9db9afe4c0420afb25967b4')
validpgpkeys=()

prepare() {
	cd "hamclock-$pkgver/ESPHamClock"
	# Add -AUR to version
	sed -i 's/"/-AUR"/g' version.h
	sed -i 's/\t-AUR"/\t"/g' version.h

	# Do not check for/install updates
	sed -i "s/tft.print (F(\"You're up to date\!\"));"'/tft.print(F("Updates disabled for AUR")); tft.setCursor (tft.width()\/8, tft.height()\/3+40); tft.print(F("If this build is outdated by more than a few days,")); tft.setCursor (tft.width()\/8, tft.height()\/3+80); tft.print(F("please email sam@kj7rrv.com.")); wdDelay(2000);/g' ESPHamClock.ino
	sed -i 's/bool found_newer = false;/return false;bool found_newer;/g' OTAupdate.cpp
}

build() {
	cd "hamclock-$pkgver/ESPHamClock"
	make -j 4 hamclock-800x480
}

package() {
	cd "hamclock-$pkgver/ESPHamClock"
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons" "$pkgdir/usr/share/licenses/$pkgname/"
	cp hamclock-800x480 "$pkgdir/usr/bin/hamclock"
	cp hamclock.png "$pkgdir/usr/share/icons"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	cat > "$pkgdir/usr/share/applications/hamclock.desktop" << HERE
[Desktop Entry]
Name=HamClock
Exec=hamclock
Icon=/usr/share/icons/hamclock.png
Terminal=false
Type=Application
Categories=HamRadio
HERE
}
