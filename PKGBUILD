# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=hackrf-git
pkgver=2022.09.1.r30.g3d39660b
pkgrel=1
pkgdesc="Driver for HackRF, allowing general purpose software defined radio (SDR)."
arch=('i686' 'x86_64')
url="https://github.com/mossmann/hackrf"
license=('GPL2')
depends=('libusb' 'fftw')
makedepends=('cmake' 'dfu-util' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib')
conflicts=('hackrf')
provides=('hackrf')
source=("$pkgname::git+https://github.com/mossmann/hackrf" 'hackrf.conf')
sha256sums=('SKIP'
            '8246a539049ec2bd6226337d8d9b4f48bd503d77de13408a5751d2a60dc76965')

pkgver() {
	cd "$srcdir/$pkgname"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "$srcdir/$pkgname"

	git submodule update --init --recursive

	# FS#41895
	sed -i 's|MODE.*$|TAG+="uaccess"|' host/libhackrf/53-hackrf.rules*
}

build() {
	cd "$srcdir/$pkgname"

	mkdir -p host/build
	pushd host/build
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_VERBOSE_MAKEFILE=OFF
	make
	popd

	mkdir -p firmware-bin
	cp -fv firmware/cpld/sgpio_if/default.xsvf firmware-bin/hackrf_cpld_default.xsvf

	cd firmware
	make -C libopencm3

	for board in HACKRF_ONE JAWBREAKER RAD1O; do
		msg "Building firmware for ${board}"

		mkdir -p "build-${board,,}"
		pushd "build-${board,,}"

		cmake .. \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DCMAKE_VERBOSE_MAKEFILE=OFF \
			-DCMAKE_C_FLAGS="-Os -g -Wall -Wextra -fno-common" \
			-DCMAKE_CXX_FLAGS="-Os -g -Wall -Wextra -fno-common" \
			-DBOARD="${board}"
		make

		[ $board = "HACKRF_ONE" ] && board="ONE"
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
