# Maintainer: Samuel Sloniker <sam@kj7rrv.com>
# Maintainer: Roy Williams <fang64@gmail.com>

pkgname=hamclock
pkgver=4.09
pkgrel=2
epoch=
pkgdesc="Clock and world map with extra features for amateur radio (800x480 version)"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://clearskyinstitute.com/ham/HamClock"
license=('MIT')
groups=()
depends=('libx11' 'libxcb')
makedepends=('patch')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "https://github.com/fang64/hamclock/archive/refs/tags/v$pkgver.tar.gz"
  "hamclock.desktop"
  "no-libgpio.patch"
)
noextract=()
sha256sums=('83cd29794b8af1a6dd210e8003379700a56556c8c8b697ed49fc346f75bc0ec5'
            'df56e16e9bfab4a6259fd8e9fdffbe8f8d24ff395d2d27434dfd4bfe4adfa85d'
            '2ce4e64ba5583c533eef3f885854e3bd7fd544f85bc35a92248d19b9a59c7c65')
validpgpkeys=()

prepare() {
	cd "hamclock-$pkgver/ESPHamClock"
	# Add -AUR to version
	sed -i 's/"/-AUR"/g' version.h
	sed -i 's/\t-AUR"/\t"/g' version.h

	# Do not check for/install updates
	sed -i "s/tft.print (F(\"You're up to date\!\"));"'/tft.print(F("Updates disabled for AUR")); tft.setCursor (tft.width()\/8, tft.height()\/3+40); tft.print(F("If this build is outdated by more than a few days,")); tft.setCursor (tft.width()\/8, tft.height()\/3+80); tft.print(F("please email fang64@gmail.com.")); wdDelay(2000);/g' ESPHamClock.ino
	sed -i 's/bool found_newer = false;/return false;bool found_newer;/g' OTAupdate.cpp

  # Patch Routine to prevent libgpio issues hamclock was built to support libgpio 1.x not anything post libgpio 2.x
  # Discussed with Elwood just going to disable support until an alternative is implemented in hamclock.
  cd ..
  patch -Np1 -i ../no-libgpio.patch

}

build() {
	cd "hamclock-$pkgver/ESPHamClock"
	make -j $(nproc) hamclock-800x480
}

package() {
	cd "hamclock-$pkgver/ESPHamClock"
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons" "$pkgdir/usr/share/licenses/$pkgname/"
	cp hamclock-800x480 "$pkgdir/usr/bin/hamclock"
	cp hamclock.png "$pkgdir/usr/share/icons"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	cp hamclock.desktop "${pkgdir}/usr/share/applications/hamclock.desktop"
        chmod -x "${pkgdir}/usr/share/applications/hamclock.desktop"
}
