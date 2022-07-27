# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=owrx_connector-git
pkgver=0.6.0.r1.g8887135
pkgrel=3
pkgdesc="Connectors used by OpenWebRX to interface with SDR hardware."
arch=('x86_64')
url="https://github.com/jketterl/owrx_connector"
license=('GPL3')
depends=('csdr' 'libsamplerate')
makedepends=('git' 'cmake')
optdepends=(
	'rtl-sdr: RTLSDR dongles support.'
	'soapysdr: Allows interfacing with SDRs of many vendors.'
)
provides=('owrx_connector')
source=("$pkgname"::'git+https://github.com/jketterl/owrx_connector')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	# use git tag or fall back to number of revisions
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
