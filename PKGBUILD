# Maintainer: Samuel Sloniker <sam@kj7rrv.com>
# Maintainer: Roy Williams <fang64@gmail.com>

pkgname=hamclock
pkgver=4.33
pkgrel=1
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
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fang64/hamclock/archive/refs/tags/v${pkgver}.tar.gz"
  "hamclock.desktop"
  "url-change.patch"
)
noextract=()
sha256sums=('6bdcf9890f396bfd318582f8f497913ba575e7f6e9c73c38744b65ce155ef665'
            'df56e16e9bfab4a6259fd8e9fdffbe8f8d24ff395d2d27434dfd4bfe4adfa85d'
            '80609a0bebe903ed77a0af4811ae1c4646a865a85a3e1ea49922bf9397564775')
validpgpkeys=()

prepare() {
	cd "hamclock-$pkgver" || exit

	# Add -AUR to version
	sed -i 's/";/-AUR";/g' ESPHamClock/version.cpp

  # Set NO_UPGRADE definition
  sed -i '18 i CXXFLAGS += -DNO_UPGRADE' ESPHamClock/Makefile

	# Patch Routine to prevent libgpio issues; hamclock was built to
	# support libgpio 1.x not, anything post libgpio 2.x. Discussed with
	# Elwood; just going to disable support until an alternative is
	# implemented in hamclock.
  # UPDATE: libgpio check is in now patch is no longer needed
	# patch -Np1 -i ../no-libgpio.patch

	# Do not check for/install updates
  # UPDATE: No longer needed just need a definition in the Makefile
	# patch -Np1 -i ../no-updates.patch
  
  # Change server from clearskyinstitute.com to hamclock.com by default
  patch -Np1 -i ../url-change.patch
}

build() {
	cd "hamclock-$pkgver/ESPHamClock" || exit
	make -j "$(nproc)" hamclock-800x480
}

package() {
	cd "hamclock-$pkgver/ESPHamClock" || exit
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons" "$pkgdir/usr/share/licenses/$pkgname/"
	cp hamclock-800x480 "$pkgdir/usr/bin/hamclock"
	cp hamclock.png "$pkgdir/usr/share/icons"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	cp ../../hamclock.desktop "${pkgdir}/usr/share/applications/hamclock.desktop"
	chmod -x "${pkgdir}/usr/share/applications/hamclock.desktop"
}
