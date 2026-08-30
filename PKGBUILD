# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=owrx_connector-luarvique
pkgver=0.6.5
pkgrel=9
pkgdesc="Connectors used by OpenWebRX to interface with SDR hardware."
arch=('x86_64' 'aarch64')
url="https://github.com/luarvique/owrx_connector"
license=('GPL-3.0-or-later')
depends=('csdr-luarvique' 'libsamplerate' 'rtl-sdr' 'soapysdr' 'fftw')
makedepends=('git' 'cmake')
provides=('owrx_connector')
conflicts=('owrx_connector')

source=("$pkgname"::"git+https://github.com/luarvique/owrx_connector#tag=${pkgver}")
md5sums=('83b2c794a25ae5a31e5974cd8b8ad43a')

build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-Wno-dev

	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install

	# Strip dangling build-id symlinks from the main package too.
	if [ -d "$pkgdir/usr/lib/.build-id" ]; then
		find "$pkgdir/usr/lib/.build-id" -type l -delete
		find "$pkgdir/usr/lib/.build-id" -type d -empty -delete
	fi
}

package_debug() {
	cd "$pkgdir"
	# Remove all build-id entries. The plain symlinks point into the main
	# package's stripped binaries (so they are dangling from the debug
	# package's perspective and namcap flags them as errors), and the .debug
	# companion symlinks point at debug files generated for stripped
	# binaries that do not actually contain debug info. Neither provides
	# value, so remove the entire tree.
	if [ -d usr/lib/debug/.build-id ]; then
		rm -rf usr/lib/debug/.build-id
	fi
}
