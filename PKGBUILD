# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=hackrf-git
pkgver=r2096.31b83ef
pkgrel=1
pkgdesc="Driver for HackRF, allowing general purpose software defined radio (SDR)."
arch=('i686' 'x86_64')
url="https://github.com/mossmann/hackrf"
license=('GPL2')
depends=('libusb' 'fftw')
makedepends=('cmake' 'dfu-util')
conflicts=('hackrf')
provides=('hackrf')
source=("$pkgname::git+https://github.com/mossmann/hackrf" 'hackrf.conf')
sha256sums=('SKIP'
		'8246a539049ec2bd6226337d8d9b4f48bd503d77de13408a5751d2a60dc76965')

pkgver() {
	cd "$srcdir/$pkgname"
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname/host"
# FS#41895
		sed -i 's|MODE.*$|TAG+="uaccess"|' libhackrf/53-hackrf.rules*
}

build() {
	cd "$srcdir/$pkgname"
		git submodule update --init --recursive

		cd "$srcdir/$pkgname/host"
		mkdir -p build
		cd build
		cmake -DCMAKE_INSTALL_PREFIX=/usr ../
		make

		cd "$srcdir/$pkgname/firmware"
		make -C libopencm3

		mkdir -p "$srcdir/$pkgname/firmware-bin"
		cp -f "cpld/sgpio_if/default.xsvf" \
		"$srcdir/$pkgname/firmware-bin/hackrf_cpld_default.xsvf"

		for board in {HACKRF_ONE,JAWBREAKER,RAD1O}; do
			msg "Building firmware for $board"
				mkdir -p "build-$board"
				pushd "build-$board"

				cmake \
				-DCMAKE_C_FLAGS="-Os -g -Wall -Wextra -fno-common" \
				-DBOARD="$board" -DCMAKE_INSTALL_PREFIX=/usr ../
				make

				[ $board = "HACKRF_ONE" ] && board=ONE
				mv -f hackrf_usb/hackrf_usb.dfu \
					"$srcdir/$pkgname/firmware-bin/hackrf_${board,,}_usb_ram.dfu"
					mv -f hackrf_usb/hackrf_usb.bin \
					"$srcdir/$pkgname/firmware-bin/hackrf_${board,,}_usb_rom_to_ram.bin"
					popd
					done
}

package() {
	cd "$srcdir/$pkgname"
		pushd host/build
		make DESTDIR="$pkgdir" install
		popd
		pushd host/libhackrf
		install -vD -m644 53-hackrf.rules "$pkgdir/usr/lib/udev/rules.d/53-hackrf.rules"
		popd
		pushd firmware-bin
		for i in *.{bin,dfu,xsvf}; do
			install -vDm644 "$i" "$pkgdir/usr/share/hackrf/$i"
				done
				popd
				install -Dm644 "$srcdir/hackrf.conf" "$pkgdir/etc/modprobe.d/hackrf.conf"
}
