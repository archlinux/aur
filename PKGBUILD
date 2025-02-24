# Maintainer: Samuel Sloniker <sam@kj7rrv.com>
# Maintainer: Roy Williams <fang64@gmail.com>

pkgname=hamclock-huge
pkgver=4.14
pkgrel=3
epoch=
pkgdesc="Clock and world map with extra features for amateur radio (3200x1920 version)"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://clearskyinstitute.com/ham/HamClock"
license=('MIT')
groups=()
depends=('libx11' 'libxcb')
makedepends=('patch')
checkdepends=()
optdepends=()
provides=('hamclock')
conflicts=('hamclock')
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "https://github.com/fang64/hamclock/archive/refs/tags/v$pkgver.tar.gz"
  "hamclock.desktop"
  "no-libgpio.patch"
  "no-updates.patch"
)
noextract=()
sha256sums=('de2a6680e04972c94b4354ffee25e82bd97dedb28e9e0eb1281829c7dc84de65'
            'df56e16e9bfab4a6259fd8e9fdffbe8f8d24ff395d2d27434dfd4bfe4adfa85d'
            '2fee906da830600a480e7ba1a83318a2485b241689b3d186ee04e56887da2dd3'
            'f3f0826a7b1f9efe76787d70ee046263b28a63f66da77c2a6c3990d1ec56ca4e')
validpgpkeys=()

prepare() {
	cd "hamclock-$pkgver" || exit

	# Add -AUR to version
	sed -i 's/";/-AUR";/g' ESPHamClock/version.cpp

	# Patch Routine to prevent libgpio issues; hamclock was built to
	# support libgpio 1.x not, anything post libgpio 2.x. Discussed with
	# Elwood; just going to disable support until an alternative is
	# implemented in hamclock.
	patch -Np1 -i ../no-libgpio.patch

	# Do not check for/install updates
	patch -Np1 -i ../no-updates.patch
}

build() {
	cd "hamclock-$pkgver/ESPHamClock" || exit
	make -j $(nproc) hamclock-3200x1920
}

package() {
	cd "hamclock-$pkgver/ESPHamClock" || exit
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons" "$pkgdir/usr/share/licenses/$pkgname/"
	cp hamclock-3200x1920 "$pkgdir/usr/bin/hamclock"
	cp hamclock.png "$pkgdir/usr/share/icons"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	cp ../../hamclock.desktop "${pkgdir}/usr/share/applications/hamclock.desktop"
	chmod -x "${pkgdir}/usr/share/applications/hamclock.desktop"
}
